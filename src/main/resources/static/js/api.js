/**
 * P&C Modern Decoupled Frontend API Client
 */
const API = {
    baseUrl: '/api',

    async request(endpoint, options = {}) {
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
            credentials: 'include' // Sends session cookies automatically
        };

        try {
            const response = await fetch(`${this.baseUrl}${endpoint}`, config);
            const data = await response.json().catch(() => null);

            if (!response.ok) {
                const message = (data && data.message) ? data.message : `HTTP Error ${response.status}`;
                throw new Error(message);
            }

            return data;
        } catch (error) {
            console.error(`API Error on [${options.method || 'GET'}] ${endpoint}:`, error);
            throw error;
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
        toast.style.zIndex = '9999';
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
