package com.thynkzone.pnc.repository;

import com.thynkzone.pnc.entity.Advertisement;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdvertisementRepository extends JpaRepository<Advertisement, Long> {

    Page<Advertisement> findByApprovalOrderByCreatedAtDesc(int approval, Pageable pageable);

    @Query("SELECT a FROM Advertisement a WHERE a.approval = 1 AND (a.country IS NULL OR a.country = :country) ORDER BY a.bid DESC")
    List<Advertisement> findActiveAdsForCountry(@Param("country") String country, Pageable pageable);

    long countByApproval(int approval);
}
