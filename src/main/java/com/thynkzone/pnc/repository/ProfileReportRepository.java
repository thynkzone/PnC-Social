package com.thynkzone.pnc.repository;

import com.thynkzone.pnc.entity.ProfileReport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileReportRepository extends JpaRepository<ProfileReport, Long> {

    Page<ProfileReport> findByStatusOrderByCreatedAtDesc(String status, Pageable pageable);

    long countByStatus(String status);
}
