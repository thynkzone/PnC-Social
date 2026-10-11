package com.thynkzone.pnc.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "profile_reports", indexes = {
    @Index(name = "idx_report_target_user", columnList = "target_user_id"),
    @Index(name = "idx_report_reporter", columnList = "reporter_id")
})
public class ProfileReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "reporter_id", length = 32, nullable = false)
    private String reporterId;

    @Column(name = "reporter_full_name", length = 255)
    private String reporterFullName;

    @Column(name = "target_user_id", length = 32, nullable = false)
    private String targetUserId;

    @Column(name = "report_type", nullable = false)
    private int reportType;

    @Column(name = "status", length = 32, nullable = false)
    private String status = "PENDING";

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    public ProfileReport() {
    }

    public ProfileReport(String reporterId, String reporterFullName, String targetUserId, int reportType) {
        this.reporterId = reporterId;
        this.reporterFullName = reporterFullName;
        this.targetUserId = targetUserId;
        this.reportType = reportType;
        this.status = "PENDING";
        this.createdAt = LocalDateTime.now();
    }

    @PrePersist
    protected void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReporterId() {
        return reporterId;
    }

    public void setReporterId(String reporterId) {
        this.reporterId = reporterId;
    }

    public String getReporterFullName() {
        return reporterFullName;
    }

    public void setReporterFullName(String reporterFullName) {
        this.reporterFullName = reporterFullName;
    }

    public String getTargetUserId() {
        return targetUserId;
    }

    public void setTargetUserId(String targetUserId) {
        this.targetUserId = targetUserId;
    }

    public int getReportType() {
        return reportType;
    }

    public void setReportType(int reportType) {
        this.reportType = reportType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
