/**
 * P&C Modern Decoupled Frontend API Client
 * Enhanced with Free-Tier Cold-Start Detection, Auto-Retry & Glassmorphism Loader
 */

const ColdStartUI = {
    modalId: 'pnc-cold-start-overlay',
    activeRequests: 0,
    timerInterval: null,
    startTime: null,
    visible: false,

    ensureStyles() {
        if (document.getElementById('pnc-cold-start-styles')) return;
        const style = document.createElement('style');
        style.id = 'pnc-cold-start-styles';
        style.textContent = `
            #pnc-cold-start-overlay {
                position: fixed;
                inset: 0;
                background: rgba(10, 10, 15, 0.78);
                backdrop-filter: blur(8px);
                -webkit-backdrop-filter: blur(8px);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 999999;
                opacity: 0;
                visibility: hidden;
                transition: opacity 0.35s ease, visibility 0.35s ease;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            }
            #pnc-cold-start-overlay.active {
                opacity: 1;
                visibility: visible;
            }
            .pnc-cold-card {
                background: rgba(28, 29, 38, 0.96);
                border: 1px solid rgba(29, 161, 242, 0.35);
                box-shadow: 0 16px 48px rgba(0, 0, 0, 0.6), 0 0 24px rgba(29, 161, 242, 0.2);
                border-radius: 18px;
                padding: 32px 28px;
                max-width: 440px;
                width: 90%;
                text-align: center;
                color: #ffffff;
                animation: pnc-scale-up 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            }
            @keyframes pnc-scale-up {
                0% { transform: scale(0.92); opacity: 0; }
                100% { transform: scale(1); opacity: 1; }
            }
            .pnc-spinner-box {
                position: relative;
                width: 76px;
                height: 76px;
                margin: 0 auto 20px auto;
            }
            .pnc-pulse-ring {
                position: absolute;
                inset: -6px;
                border-radius: 50%;
                border: 2px solid #1da1f2;
                animation: pnc-ring-pulse 2.2s infinite cubic-bezier(0.215, 0.61, 0.355, 1);
                opacity: 0.8;
            }
            @keyframes pnc-ring-pulse {
                0% { transform: scale(0.7); opacity: 1; }
                100% { transform: scale(1.4); opacity: 0; }
            }
            .pnc-spin-circle {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                border: 3px solid rgba(29, 161, 242, 0.15);
                border-top-color: #1da1f2;
                border-right-color: #0a8cd8;
                animation: pnc-spin 0.85s linear infinite;
            }
            @keyframes pnc-spin {
                to { transform: rotate(360deg); }
            }
            .pnc-bolt-icon {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-size: 28px;
                line-height: 1;
            }
            .pnc-cold-title {
                font-size: 20px;
                font-weight: 700;
                margin: 0 0 8px 0;
                letter-spacing: -0.3px;
                color: #ffffff;
            }
            .pnc-cold-msg {
                font-size: 13.5px;
                line-height: 1.55;
                color: #a0a5b5;
                margin: 0 0 18px 0;
            }
            .pnc-timer-pill {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 7px 16px;
                border-radius: 20px;
                background: rgba(29, 161, 242, 0.12);
                border: 1px solid rgba(29, 161, 242, 0.3);
                color: #1da1f2;
                font-size: 13px;
                font-weight: 600;
            }
            .pnc-timer-dot {
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background: #1da1f2;
                animation: pnc-pulse-dot 1.2s infinite alternate;
            }
            @keyframes pnc-pulse-dot {
                0% { opacity: 0.3; transform: scale(0.7); }
                100% { opacity: 1; transform: scale(1.3); }
            }
            .pnc-retry-msg {
                font-size: 12px;
                color: #ffaa00;
                margin-top: 10px;
                font-weight: 500;
            }
        `;
        document.head.appendChild(style);
    },

    createOverlay() {
        this.ensureStyles();
        let overlay = document.getElementById(this.modalId);
        if (!overlay) {
            overlay = document.createElement('div');
            overlay.id = this.modalId;
            overlay.innerHTML = `
                <div class="pnc-cold-card">
                    <div class="pnc-spinner-box">
                        <div class="pnc-pulse-ring"></div>
                        <div class="pnc-spin-circle"></div>
                        <div class="pnc-bolt-icon">⚡</div>
                    </div>
                    <h3 class="pnc-cold-title" id="pnc-cold-title">Waking Up Cloud Service</h3>
                    <p class="pnc-cold-msg" id="pnc-cold-desc">
                        Render & Neon DB serverless instances spin down when idle on free tier. Waking up usually takes ~15–30 seconds. Thank you for your patience!
                    </p>
                    <div class="pnc-timer-pill">
                        <span class="pnc-timer-dot"></span>
                        <span id="pnc-cold-counter">Waking server: 1s</span>
                    </div>
                    <div class="pnc-retry-msg" id="pnc-cold-retry" style="display: none;"></div>
                </div>
            `;
            document.body.appendChild(overlay);
        }
        return overlay;
    },

    show(customTitle = null, customDesc = null) {
        this.visible = true;
        const overlay = this.createOverlay();
        if (customTitle) document.getElementById('pnc-cold-title').innerText = customTitle;
        if (customDesc) document.getElementById('pnc-cold-desc').innerText = customDesc;

        if (!this.startTime) {
            this.startTime = Date.now();
            const counter = document.getElementById('pnc-cold-counter');
            this.timerInterval = setInterval(() => {
                const elapsed = Math.floor((Date.now() - this.startTime) / 1000);
                if (counter) counter.innerText = `Waking server: ${elapsed}s`;
            }, 1000);
        }

        overlay.classList.add('active');
    },

    setRetryStatus(attempt, maxAttempts) {
        const retryEl = document.getElementById('pnc-cold-retry');
        if (retryEl) {
            retryEl.style.display = 'block';
            retryEl.innerText = `Starting up... Retrying connection (${attempt}/${maxAttempts})`;
        }
    },

    hide() {
        if (!this.visible) return;
        const counter = document.getElementById('pnc-cold-counter');
        if (counter) counter.innerText = 'Connected! ✅';

        setTimeout(() => {
            const overlay = document.getElementById(this.modalId);
            if (overlay) overlay.classList.remove('active');
            if (this.timerInterval) {
                clearInterval(this.timerInterval);
                this.timerInterval = null;
            }
            this.startTime = null;
            this.visible = false;
            const retryEl = document.getElementById('pnc-cold-retry');
            if (retryEl) retryEl.style.display = 'none';
        }, 400);
    }
};

const API = {
    baseUrl: '/api',

    async request(endpoint, options = {}, retries = 5, retryDelay = 2500) {
        const defaultHeaders = {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        };

        const config = {
            ...options,
            headers: {
                ...defaultHeaders,
                ...options.headers
            },
            credentials: 'include'
        };

        // Delay popup by 800ms so fast queries don't trigger loader
        let loaderTimer = null;
        if (ColdStartUI.activeRequests === 0) {
            loaderTimer = setTimeout(() => {
                ColdStartUI.show();
            }, 800);
        }
        ColdStartUI.activeRequests++;

        for (let attempt = 1; attempt <= retries; attempt++) {
            try {
                const response = await fetch(`${this.baseUrl}${endpoint}`, config);

                // Render returns 502/503/504 while waking up container from sleep
                if ([502, 503, 504].includes(response.status) && attempt < retries) {
                    ColdStartUI.show();
                    ColdStartUI.setRetryStatus(attempt, retries);
                    await new Promise(r => setTimeout(r, retryDelay));
                    continue;
                }

                const data = await response.json().catch(() => null);

                if (!response.ok) {
                    const message = (data && data.message) ? data.message : `HTTP Error ${response.status}`;
                    throw new Error(message);
                }

                clearTimeout(loaderTimer);
                ColdStartUI.activeRequests = Math.max(0, ColdStartUI.activeRequests - 1);
                if (ColdStartUI.activeRequests === 0) {
                    ColdStartUI.hide();
                }
                return data;

            } catch (error) {
                // If network connection failed while server is booting, retry
                const isNetworkFailure = error instanceof TypeError || error.message.includes('fetch');
                if (isNetworkFailure && attempt < retries) {
                    ColdStartUI.show();
                    ColdStartUI.setRetryStatus(attempt, retries);
                    await new Promise(r => setTimeout(r, retryDelay));
                    continue;
                }

                clearTimeout(loaderTimer);
                ColdStartUI.activeRequests = Math.max(0, ColdStartUI.activeRequests - 1);
                if (ColdStartUI.activeRequests === 0) {
                    ColdStartUI.hide();
                }
                console.error(`API Error on [${options.method || 'GET'}] ${endpoint}:`, error);
                throw error;
            }
        }
    },

    get(endpoint) {
        return this.request(endpoint, { method: 'GET' });
    },

    post(endpoint, body) {
        return this.request(endpoint, {
            method: 'POST',
            body: body ? JSON.stringify(body) : undefined
        });
    },

    put(endpoint, body) {
        return this.request(endpoint, {
            method: 'PUT',
            body: body ? JSON.stringify(body) : undefined
        });
    },

    delete(endpoint) {
        return this.request(endpoint, { method: 'DELETE' });
    },

    // Background pre-warm probe
    async warmup() {
        try {
            await fetch('/actuator/health').catch(() => {});
        } catch (_) {}
    },

    // Auth
    getCurrentUser() {
        return this.get('/auth/me');
    },

    login(email, password) {
        return this.post('/auth/login', { email, password });
    },

    signup(email, password, recoveryCode) {
        return this.post('/auth/register', { email, password, recoveryCode });
    },

    verifyCode(email, code) {
        return this.post('/auth/verify', { email, code });
    },

    logout() {
        return this.post('/auth/logout');
    },

    // Posts & Feed
    getFeed(page = 0, size = 15) {
        return this.get(`/posts/feed?page=${page}&size=${size}`);
    },

    getUserPosts(userId, page = 0, size = 15) {
        return this.get(`/posts/user/${userId}?page=${page}&size=${size}`);
    },

    createPost(content, postType = 3, privacy = 4, imageUrl = null) {
        return this.post('/posts', { content, postType, privacy, imageUrl });
    },

    updatePost(postId, content, postType, privacy) {
        return this.put(`/posts/${postId}`, { content, postType, privacy });
    },

    deletePost(postId) {
        return this.delete(`/posts/${postId}`);
    },

    reactToPost(postId, type) {
        return this.post(`/posts/${postId}/react`, { type });
    },

    addComment(postId, commentText) {
        return this.post(`/posts/${postId}/comments`, { commentText });
    },

    deleteComment(postId, commentId) {
        return this.delete(`/posts/${postId}/comments/${commentId}`);
    },

    hidePost(postId, hideAuthor = false) {
        return this.post(`/posts/${postId}/hide?hideAuthor=${hideAuthor}`);
    },

    // User Profile
    getUserProfile(userId) {
        return this.get(`/users/${userId}`);
    },

    updateProfile(profileData) {
        return this.put('/users/profile', profileData);
    },

    searchUsers(query, page = 0, size = 20) {
        return this.get(`/users/search?q=${encodeURIComponent(query)}&page=${page}&size=${size}`);
    },

    getSuggestions() {
        return this.get('/users/suggestions');
    },

    // Connections
    sendCoworkerRequest(targetUserId) {
        return this.post('/connections/request', { targetUserId });
    },

    acceptCoworkerRequest(targetUserId) {
        return this.post('/connections/accept', { targetUserId });
    },

    cancelCoworkerRequest(targetUserId) {
        return this.post('/connections/cancel', { targetUserId });
    },

    disconnectCoworker(targetUserId) {
        return this.post('/connections/disconnect', { targetUserId });
    },

    follow(targetUserId) {
        return this.post('/connections/follow', { targetUserId });
    },

    unfollow(targetUserId) {
        return this.post('/connections/unfollow', { targetUserId });
    },

    getConnectionStatus(targetUserId) {
        return this.get(`/connections/status/${targetUserId}`);
    },

    getCoworkers(userId = null) {
        return this.get(`/connections/coworkers${userId ? `?userId=${userId}` : ''}`);
    },

    getFollowing(userId = null) {
        return this.get(`/connections/following${userId ? `?userId=${userId}` : ''}`);
    },

    getFollowers(userId = null) {
        return this.get(`/connections/followers${userId ? `?userId=${userId}` : ''}`);
    },

    getPendingRequests() {
        return this.get('/connections/pending');
    },

    // Notifications
    getNotifications(page = 0, size = 20) {
        return this.get(`/notifications?page=${page}&size=${size}`);
    },

    markNotificationRead(id) {
        return this.put(`/notifications/${id}/read`);
    }
};

// Auto-probe health check on page load to pre-warm cold server
if (typeof window !== 'undefined') {
    window.addEventListener('DOMContentLoaded', () => {
        API.warmup();
    });
}

// UI Toast Notification Helper
function showToast(message, isError = false) {
    let toast = document.getElementById('global-toast');
    if (!toast) {
        toast = document.createElement('div');
        toast.id = 'global-toast';
        toast.style.position = 'fixed';
        toast.style.bottom = '24px';
        toast.style.right = '24px';
        toast.style.padding = '12px 20px';
        toast.style.borderRadius = '8px';
        toast.style.color = '#fff';
        toast.style.fontWeight = '600';
        toast.style.zIndex = '9999999';
        toast.style.boxShadow = '0 4px 12px rgba(0,0,0,0.25)';
        toast.style.transition = 'all 0.3s ease';
        document.body.appendChild(toast);
    }
    toast.style.backgroundColor = isError ? '#e0245e' : '#10b981';
    toast.innerText = message;
    toast.style.display = 'block';
    setTimeout(() => {
        toast.style.display = 'none';
    }, 4000);
}
