package com.thynkzone.pnc.controller;

import com.thynkzone.pnc.dto.ApiResponse;
import com.thynkzone.pnc.entity.Advertisement;
import com.thynkzone.pnc.repository.AdvertisementRepository;
import com.thynkzone.pnc.service.AuthService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/ads")
public class AdvertisementController {

    private final AdvertisementRepository adRepository;
    private final AuthService authService;

    public AdvertisementController(AdvertisementRepository adRepository, AuthService authService) {
        this.adRepository = adRepository;
        this.authService = authService;
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<Advertisement>>> getAds(
            @RequestParam(value = "country", defaultValue = "Bangladesh") String country) {
        List<Advertisement> ads = adRepository.findActiveAdsForCountry(country, PageRequest.of(0, 10));
        return ResponseEntity.ok(ApiResponse.ok(ads));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<Advertisement>> createAd(
            @RequestBody Map<String, Object> payload,
            HttpServletRequest request) {
        String currentUserId = authService.getCurrentUserId(request);
        if (currentUserId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(ApiResponse.error("Authentication required to submit an advertisement"));
        }

        String text = (String) payload.getOrDefault("text", "");
        String pic = (String) payload.getOrDefault("pic", "");
        String country = (String) payload.getOrDefault("country", "Bangladesh");
        String ticket = (String) payload.getOrDefault("adTicket", "TKT-" + System.currentTimeMillis());
        Double bid = payload.get("bid") != null ? Double.parseDouble(payload.get("bid").toString()) : 1.0;

        Advertisement ad = new Advertisement(
                currentUserId,
                "Advertiser",
                "AD-" + System.currentTimeMillis(),
                text,
                pic,
                country,
                ticket
        );
        ad.setBid(bid);
        ad.setApproval(1); // Auto-approve sponsored ads for display

        Advertisement saved = adRepository.save(ad);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.ok("Advertisement submitted successfully.", saved));
    }
}
