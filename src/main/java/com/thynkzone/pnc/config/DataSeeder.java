package com.thynkzone.pnc.config;

import com.thynkzone.pnc.entity.Notification;
import com.thynkzone.pnc.entity.Post;
import com.thynkzone.pnc.entity.User;
import com.thynkzone.pnc.entity.UserProfile;
import com.thynkzone.pnc.repository.NotificationRepository;
import com.thynkzone.pnc.repository.PostRepository;
import com.thynkzone.pnc.repository.UserProfileRepository;
import com.thynkzone.pnc.repository.UserRepository;
import com.thynkzone.pnc.util.PasswordSecurity;
import com.thynkzone.pnc.util.UidGenerator;
import jakarta.persistence.EntityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Enterprise Database Seeder
 * Automatically populates the database with 100 realistic Bangladeshi tech professionals
 * and 100 meaningful, authentic public posts discussing engineering, architecture,
 * performance, and workplace culture.
 */
@Component
public class DataSeeder implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(DataSeeder.class);

    private final UserRepository userRepository;
    private final UserProfileRepository userProfileRepository;
    private final PostRepository postRepository;
    private final NotificationRepository notificationRepository;
    private final PasswordSecurity passwordSecurity;
    private final EntityManager entityManager;

    public DataSeeder(UserRepository userRepository,
                      UserProfileRepository userProfileRepository,
                      PostRepository postRepository,
                      NotificationRepository notificationRepository,
                      PasswordSecurity passwordSecurity,
                      EntityManager entityManager) {
        this.userRepository = userRepository;
        this.userProfileRepository = userProfileRepository;
        this.postRepository = postRepository;
        this.notificationRepository = notificationRepository;
        this.passwordSecurity = passwordSecurity;
        this.entityManager = entityManager;
    }

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        long userCount = userRepository.count();
        long postCount = postRepository.count();

        if (userCount >= 100 && postCount >= 100) {
            log.info("Database already seeded with {} users and {} posts. Skipping seeder.", userCount, postCount);
            return;
        }

        log.info("Seeding database with 100 authentic Bangladeshi users and 100 meaningful public posts...");

        // Precompute standard password hash once to ensure instant startup
        String defaultPasswordHash = passwordSecurity.hashPassword("PncSocial@2025");
        String defaultRecovery = "789123";

        List<UserData> seedUsers = getSeedUserData();
        java.util.Set<String> existingEmails = new java.util.HashSet<>(
                userRepository.findAll().stream().map(u -> u.getEmail().toLowerCase()).toList()
        );

        List<User> savedUsers = new ArrayList<>();
        List<UserProfile> savedProfiles = new ArrayList<>();

        for (int i = 0; i < seedUsers.size(); i++) {
            UserData uData = seedUsers.get(i);
            if (existingEmails.contains(uData.email().toLowerCase())) {
                continue;
            }

            String uid = UidGenerator.generateId(10);
            User user = new User(uid, uData.email(), defaultPasswordHash, defaultRecovery);
            user.setSessionD(UidGenerator.generateToken());
            user.setSessionA(UidGenerator.generateToken());
            user.setCreatedAt(LocalDateTime.now().minusDays(30 + (i % 60)));
            savedUsers.add(user);

            UserProfile profile = new UserProfile(uid);
            profile.setFirstName(uData.firstName());
            profile.setLastName(uData.lastName());
            profile.setFullName(uData.fullName());
            profile.setCountry("Bangladesh");
            profile.setPlace(uData.place());
            profile.setAbout(uData.bio());
            profile.setRating(uData.rating());
            profile.setRole("USER");
            profile.setProfilePic("prof.png");
            profile.setBackgroundPic("prof.png");
            profile.setCreatedAt(user.getCreatedAt());
            savedProfiles.add(profile);
        }

        if (!savedUsers.isEmpty()) {
            for (int i = 0; i < savedUsers.size(); i++) {
                entityManager.persist(savedUsers.get(i));
                entityManager.persist(savedProfiles.get(i));
                if (i % 25 == 0) {
                    entityManager.flush();
                }
            }
            entityManager.flush();
            log.info("Saved {} new Bangladeshi users and profiles.", savedUsers.size());
        }

        // Retrieve all available profiles for post authorship
        List<UserProfile> allProfiles = userProfileRepository.findAll();
        if (allProfiles.isEmpty()) {
            log.warn("No user profiles available to author posts.");
            return;
        }

        if (postRepository.count() < 100) {
            List<String> postTexts = getSeedPostTexts();
            List<Post> postsToSave = new ArrayList<>();
            Random random = new Random(42);

            for (int i = 0; i < postTexts.size(); i++) {
                UserProfile author = allProfiles.get(i % allProfiles.size());
                String postId = UidGenerator.generateId(10);
                String content = postTexts.get(i);

                Post post = new Post(
                        postId,
                        author.getId(),
                        author.getFullName(),
                        content,
                        null,
                        (i % 5 == 0) ? 2 : 3, // Workplace Update or Fact
                        4                    // Public
                );
                post.setCountry("Bangladesh");
                post.setCreatedAt(LocalDateTime.now().minusHours(i * 4 + (i % 7)));
                postsToSave.add(post);
            }

            for (int i = 0; i < postsToSave.size(); i++) {
                entityManager.persist(postsToSave.get(i));
                if (i % 25 == 0) {
                    entityManager.flush();
                }
            }
            entityManager.flush();
            log.info("Saved {} relevant and meaningful public posts.", postsToSave.size());
        }

        log.info("Database seeding successfully completed.");
    }

    private record UserData(String firstName, String lastName, String fullName, String email, String place, String bio, int rating) {}

    private List<UserData> getSeedUserData() {
        List<UserData> list = new ArrayList<>();
        list.add(new UserData("Tanvir", "Rahman", "Tanvir Rahman", "tanvir.rahman1@pnc.social", "Dhaka, Bangladesh", "Lead Backend Engineer at bKash Limited. Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 250));
        list.add(new UserData("Tahmid", "Ahmed", "Tahmid Ahmed", "tahmid.ahmed2@pnc.social", "Dhaka, Bangladesh", "Senior Software Engineer at Pathao. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 335));
        list.add(new UserData("Farhan", "Hossain", "Farhan Hossain", "farhan.hossain3@pnc.social", "Dhaka, Bangladesh", "Software Architect at Brain Station 23. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 420));
        list.add(new UserData("Anika", "Hasan", "Anika Hasan", "anika.hasan4@pnc.social", "Dhaka, Bangladesh", "Full Stack Developer at ShopUp. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 505));
        list.add(new UserData("Nusrat", "Chowdhury", "Nusrat Chowdhury", "nusrat.chowdhury5@pnc.social", "Dhaka, Bangladesh", "DevOps & Cloud Engineer at Chaldal. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 590));
        list.add(new UserData("Sadia", "Islam", "Sadia Islam", "sadia.islam6@pnc.social", "Dhaka, Bangladesh", "Engineering Manager at TigerIT Bangladesh. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 675));
        list.add(new UserData("Mehedi", "Khan", "Mehedi Khan", "mehedi.khan7@pnc.social", "Dhaka, Bangladesh", "Principal Systems Engineer at Therap BD. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 760));
        list.add(new UserData("Ashfaq", "Haque", "Ashfaq Haque", "ashfaq.haque8@pnc.social", "Dhaka, Bangladesh", "Tech Lead at Kaz Software. Championing clean architecture, test-driven development, and reliable software delivery.", 845));
        list.add(new UserData("Nabila", "Alam", "Nabila Alam", "nabila.alam9@pnc.social", "Dhaka, Bangladesh", "Platform Engineer at Optimizely BD. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 930));
        list.add(new UserData("Tasnim", "Karim", "Tasnim Karim", "tasnim.karim10@pnc.social", "Dhaka, Bangladesh", "Site Reliability Engineer at SELISE Digital Platforms. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 1015));
        list.add(new UserData("Salman", "Mahmud", "Salman Mahmud", "salman.mahmud11@pnc.social", "Dhaka, Bangladesh", "QA Automation Lead at Dynamic Solution Innovators (DSi). Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 1100));
        list.add(new UserData("Rifat", "Sarkar", "Rifat Sarkar", "rifat.sarkar12@pnc.social", "Dhaka, Bangladesh", "Data Platform Engineer at Cefalo Bangladesh. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 1185));
        list.add(new UserData("Ayesha", "Uddin", "Ayesha Uddin", "ayesha.uddin13@pnc.social", "Dhaka, Bangladesh", "Security & DevSecOps Engineer at Enosis Solutions. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 1270));
        list.add(new UserData("Sabrina", "Bhuiyan", "Sabrina Bhuiyan", "sabrina.bhuiyan14@pnc.social", "Dhaka, Bangladesh", "Product Manager at Sheba.xyz. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 1355));
        list.add(new UserData("Shakib", "Akter", "Shakib Akter", "shakib.akter15@pnc.social", "Dhaka, Bangladesh", "Database Administrator at BRAC IT Services. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 1440));
        list.add(new UserData("Rakib", "Jahan", "Rakib Jahan", "rakib.jahan16@pnc.social", "Dhaka, Bangladesh", "Senior Java Developer at Grameenphone. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 1525));
        list.add(new UserData("Sourav", "Dewan", "Sourav Dewan", "sourav.dewan17@pnc.social", "Dhaka, Bangladesh", "Lead Backend Engineer at Robi Axiata. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 1610));
        list.add(new UserData("Fahim", "Majumder", "Fahim Majumder", "fahim.majumder18@pnc.social", "Dhaka, Bangladesh", "Senior Software Engineer at Banglalink. Championing clean architecture, test-driven development, and reliable software delivery.", 1695));
        list.add(new UserData("Samia", "Talukder", "Samia Talukder", "samia.talukder19@pnc.social", "Dhaka, Bangladesh", "Software Architect at ShareTrip. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 1780));
        list.add(new UserData("Nafis", "Sikder", "Nafis Sikder", "nafis.sikder20@pnc.social", "Dhaka, Bangladesh", "Full Stack Developer at Shikho. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 1865));
        list.add(new UserData("Zubair", "Miah", "Zubair Miah", "zubair.miah21@pnc.social", "Dhaka, Bangladesh", "DevOps & Cloud Engineer at 10 Minute School. Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 1950));
        list.add(new UserData("Raihan", "Ali", "Raihan Ali", "raihan.ali22@pnc.social", "Dhaka, Bangladesh", "Engineering Manager at Reve Systems. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 2035));
        list.add(new UserData("Mahir", "Mostafa", "Mahir Mostafa", "mahir.mostafa23@pnc.social", "Dhaka, Bangladesh", "Principal Systems Engineer at Kona Software Lab. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 2120));
        list.add(new UserData("Shaila", "Siddiqui", "Shaila Siddiqui", "shaila.siddiqui24@pnc.social", "Dhaka, Bangladesh", "Tech Lead at Samsung R&D Institute BD. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 2205));
        list.add(new UserData("Ishtiaque", "Munshi", "Ishtiaque Munshi", "ishtiaque.munshi25@pnc.social", "Dhaka, Bangladesh", "Platform Engineer at Augmedix Bangladesh. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 2290));
        list.add(new UserData("Sumaiya", "Kazi", "Sumaiya Kazi", "sumaiya.kazi26@pnc.social", "Dhaka, Bangladesh", "Site Reliability Engineer at Portonics Limited. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 2375));
        list.add(new UserData("Imran", "Barua", "Imran Barua", "imran.barua27@pnc.social", "Chittagong, Bangladesh", "QA Automation Lead at Techforce Bangladesh. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 2460));
        list.add(new UserData("Farzana", "Paul", "Farzana Paul", "farzana.paul28@pnc.social", "Sylhet, Bangladesh", "Data Platform Engineer at Inovace Technologies. Championing clean architecture, test-driven development, and reliable software delivery.", 2545));
        list.add(new UserData("Tariq", "Das", "Tariq Das", "tariq.das29@pnc.social", "Dhaka, Bangladesh", "Security & DevSecOps Engineer at Orbitax Bangladesh. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 2630));
        list.add(new UserData("Munira", "Biswas", "Munira Biswas", "munira.biswas30@pnc.social", "Gazipur, Bangladesh", "Product Manager at Walton Hi-Tech R&D. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 2715));
        list.add(new UserData("Arif", "Rahman", "Arif Rahman", "arif.rahman31@pnc.social", "Dhaka, Bangladesh", "Database Administrator at bKash Limited. Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 2800));
        list.add(new UserData("Tanzim", "Ahmed", "Tanzim Ahmed", "tanzim.ahmed32@pnc.social", "Dhaka, Bangladesh", "Senior Java Developer at Pathao. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 2885));
        list.add(new UserData("Fariha", "Hossain", "Fariha Hossain", "fariha.hossain33@pnc.social", "Dhaka, Bangladesh", "Lead Backend Engineer at Brain Station 23. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 2970));
        list.add(new UserData("Muntasir", "Hasan", "Muntasir Hasan", "muntasir.hasan34@pnc.social", "Dhaka, Bangladesh", "Senior Software Engineer at ShopUp. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 3055));
        list.add(new UserData("Bushra", "Chowdhury", "Bushra Chowdhury", "bushra.chowdhury35@pnc.social", "Dhaka, Bangladesh", "Software Architect at Chaldal. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 3140));
        list.add(new UserData("Asif", "Islam", "Asif Islam", "asif.islam36@pnc.social", "Dhaka, Bangladesh", "Full Stack Developer at TigerIT Bangladesh. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 3225));
        list.add(new UserData("Nazmul", "Khan", "Nazmul Khan", "nazmul.khan37@pnc.social", "Dhaka, Bangladesh", "DevOps & Cloud Engineer at Therap BD. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 3310));
        list.add(new UserData("Shabab", "Haque", "Shabab Haque", "shabab.haque38@pnc.social", "Dhaka, Bangladesh", "Engineering Manager at Kaz Software. Championing clean architecture, test-driven development, and reliable software delivery.", 3395));
        list.add(new UserData("Lamia", "Alam", "Lamia Alam", "lamia.alam39@pnc.social", "Dhaka, Bangladesh", "Principal Systems Engineer at Optimizely BD. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 3480));
        list.add(new UserData("Zareen", "Karim", "Zareen Karim", "zareen.karim40@pnc.social", "Dhaka, Bangladesh", "Tech Lead at SELISE Digital Platforms. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 3565));
        list.add(new UserData("Sifat", "Mahmud", "Sifat Mahmud", "sifat.mahmud41@pnc.social", "Dhaka, Bangladesh", "Platform Engineer at Dynamic Solution Innovators (DSi). Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 3650));
        list.add(new UserData("Shihab", "Sarkar", "Shihab Sarkar", "shihab.sarkar42@pnc.social", "Dhaka, Bangladesh", "Site Reliability Engineer at Cefalo Bangladesh. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 3735));
        list.add(new UserData("Afnan", "Uddin", "Afnan Uddin", "afnan.uddin43@pnc.social", "Dhaka, Bangladesh", "QA Automation Lead at Enosis Solutions. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 3820));
        list.add(new UserData("Afsana", "Bhuiyan", "Afsana Bhuiyan", "afsana.bhuiyan44@pnc.social", "Dhaka, Bangladesh", "Data Platform Engineer at Sheba.xyz. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 3905));
        list.add(new UserData("Mahmud", "Akter", "Mahmud Akter", "mahmud.akter45@pnc.social", "Dhaka, Bangladesh", "Security & DevSecOps Engineer at BRAC IT Services. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 3990));
        list.add(new UserData("Sharmin", "Jahan", "Sharmin Jahan", "sharmin.jahan46@pnc.social", "Dhaka, Bangladesh", "Product Manager at Grameenphone. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 4075));
        list.add(new UserData("Rehan", "Dewan", "Rehan Dewan", "rehan.dewan47@pnc.social", "Dhaka, Bangladesh", "Database Administrator at Robi Axiata. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 4160));
        list.add(new UserData("Nuzhat", "Majumder", "Nuzhat Majumder", "nuzhat.majumder48@pnc.social", "Dhaka, Bangladesh", "Senior Java Developer at Banglalink. Championing clean architecture, test-driven development, and reliable software delivery.", 4245));
        list.add(new UserData("Wasif", "Talukder", "Wasif Talukder", "wasif.talukder49@pnc.social", "Dhaka, Bangladesh", "Lead Backend Engineer at ShareTrip. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 4330));
        list.add(new UserData("Humaira", "Sikder", "Humaira Sikder", "humaira.sikder50@pnc.social", "Dhaka, Bangladesh", "Senior Software Engineer at Shikho. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 4415));
        list.add(new UserData("Kazi", "Miah", "Kazi Miah", "kazi.miah51@pnc.social", "Dhaka, Bangladesh", "Software Architect at 10 Minute School. Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 4500));
        list.add(new UserData("Shahriar", "Ali", "Shahriar Ali", "shahriar.ali52@pnc.social", "Dhaka, Bangladesh", "Full Stack Developer at Reve Systems. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 4585));
        list.add(new UserData("Tamim", "Mostafa", "Tamim Mostafa", "tamim.mostafa53@pnc.social", "Dhaka, Bangladesh", "DevOps & Cloud Engineer at Kona Software Lab. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 4670));
        list.add(new UserData("Rubayet", "Siddiqui", "Rubayet Siddiqui", "rubayet.siddiqui54@pnc.social", "Dhaka, Bangladesh", "Engineering Manager at Samsung R&D Institute BD. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 4755));
        list.add(new UserData("Sharif", "Munshi", "Sharif Munshi", "sharif.munshi55@pnc.social", "Dhaka, Bangladesh", "Principal Systems Engineer at Augmedix Bangladesh. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 4840));
        list.add(new UserData("Nayem", "Kazi", "Nayem Kazi", "nayem.kazi56@pnc.social", "Dhaka, Bangladesh", "Tech Lead at Portonics Limited. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 4925));
        list.add(new UserData("Tanha", "Barua", "Tanha Barua", "tanha.barua57@pnc.social", "Chittagong, Bangladesh", "Platform Engineer at Techforce Bangladesh. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 5010));
        list.add(new UserData("Sadman", "Paul", "Sadman Paul", "sadman.paul58@pnc.social", "Sylhet, Bangladesh", "Site Reliability Engineer at Inovace Technologies. Championing clean architecture, test-driven development, and reliable software delivery.", 5095));
        list.add(new UserData("Mahi", "Das", "Mahi Das", "mahi.das59@pnc.social", "Dhaka, Bangladesh", "QA Automation Lead at Orbitax Bangladesh. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 5180));
        list.add(new UserData("Shafin", "Biswas", "Shafin Biswas", "shafin.biswas60@pnc.social", "Gazipur, Bangladesh", "Data Platform Engineer at Walton Hi-Tech R&D. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 5265));
        list.add(new UserData("Ferdous", "Rahman", "Ferdous Rahman", "ferdous.rahman61@pnc.social", "Dhaka, Bangladesh", "Security & DevSecOps Engineer at bKash Limited. Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 5350));
        list.add(new UserData("Naimur", "Ahmed", "Naimur Ahmed", "naimur.ahmed62@pnc.social", "Dhaka, Bangladesh", "Product Manager at Pathao. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 5435));
        list.add(new UserData("Jannat", "Hossain", "Jannat Hossain", "jannat.hossain63@pnc.social", "Dhaka, Bangladesh", "Database Administrator at Brain Station 23. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 5520));
        list.add(new UserData("Mehrab", "Hasan", "Mehrab Hasan", "mehrab.hasan64@pnc.social", "Dhaka, Bangladesh", "Senior Java Developer at ShopUp. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 5605));
        list.add(new UserData("Hasibul", "Chowdhury", "Hasibul Chowdhury", "hasibul.chowdhury65@pnc.social", "Dhaka, Bangladesh", "Lead Backend Engineer at Chaldal. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 5690));
        list.add(new UserData("Adnan", "Islam", "Adnan Islam", "adnan.islam66@pnc.social", "Dhaka, Bangladesh", "Senior Software Engineer at TigerIT Bangladesh. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 5775));
        list.add(new UserData("Shohan", "Khan", "Shohan Khan", "shohan.khan67@pnc.social", "Dhaka, Bangladesh", "Software Architect at Therap BD. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 5860));
        list.add(new UserData("Rizwan", "Haque", "Rizwan Haque", "rizwan.haque68@pnc.social", "Dhaka, Bangladesh", "Full Stack Developer at Kaz Software. Championing clean architecture, test-driven development, and reliable software delivery.", 5945));
        list.add(new UserData("Sabit", "Alam", "Sabit Alam", "sabit.alam69@pnc.social", "Dhaka, Bangladesh", "DevOps & Cloud Engineer at Optimizely BD. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 6030));
        list.add(new UserData("Niloy", "Karim", "Niloy Karim", "niloy.karim70@pnc.social", "Dhaka, Bangladesh", "Engineering Manager at SELISE Digital Platforms. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 6115));
        list.add(new UserData("Monir", "Mahmud", "Monir Mahmud", "monir.mahmud71@pnc.social", "Dhaka, Bangladesh", "Principal Systems Engineer at Dynamic Solution Innovators (DSi). Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 6200));
        list.add(new UserData("Masud", "Sarkar", "Masud Sarkar", "masud.sarkar72@pnc.social", "Dhaka, Bangladesh", "Tech Lead at Cefalo Bangladesh. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 6285));
        list.add(new UserData("Labib", "Uddin", "Labib Uddin", "labib.uddin73@pnc.social", "Dhaka, Bangladesh", "Platform Engineer at Enosis Solutions. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 6370));
        list.add(new UserData("Rowan", "Bhuiyan", "Rowan Bhuiyan", "rowan.bhuiyan74@pnc.social", "Dhaka, Bangladesh", "Site Reliability Engineer at Sheba.xyz. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 6455));
        list.add(new UserData("Arham", "Akter", "Arham Akter", "arham.akter75@pnc.social", "Dhaka, Bangladesh", "QA Automation Lead at BRAC IT Services. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 6540));
        list.add(new UserData("Samiul", "Jahan", "Samiul Jahan", "samiul.jahan76@pnc.social", "Dhaka, Bangladesh", "Data Platform Engineer at Grameenphone. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 6625));
        list.add(new UserData("Alvee", "Dewan", "Alvee Dewan", "alvee.dewan77@pnc.social", "Dhaka, Bangladesh", "Security & DevSecOps Engineer at Robi Axiata. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 6710));
        list.add(new UserData("Towsif", "Majumder", "Towsif Majumder", "towsif.majumder78@pnc.social", "Dhaka, Bangladesh", "Product Manager at Banglalink. Championing clean architecture, test-driven development, and reliable software delivery.", 6795));
        list.add(new UserData("Maliha", "Talukder", "Maliha Talukder", "maliha.talukder79@pnc.social", "Dhaka, Bangladesh", "Database Administrator at ShareTrip. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 6880));
        list.add(new UserData("Sanower", "Sikder", "Sanower Sikder", "sanower.sikder80@pnc.social", "Dhaka, Bangladesh", "Senior Java Developer at Shikho. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 6965));
        list.add(new UserData("Tashfia", "Miah", "Tashfia Miah", "tashfia.miah81@pnc.social", "Dhaka, Bangladesh", "Lead Backend Engineer at 10 Minute School. Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 7050));
        list.add(new UserData("Mushfiq", "Ali", "Mushfiq Ali", "mushfiq.ali82@pnc.social", "Dhaka, Bangladesh", "Senior Software Engineer at Reve Systems. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 7135));
        list.add(new UserData("Arman", "Mostafa", "Arman Mostafa", "arman.mostafa83@pnc.social", "Dhaka, Bangladesh", "Software Architect at Kona Software Lab. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 7220));
        list.add(new UserData("Towhid", "Siddiqui", "Towhid Siddiqui", "towhid.siddiqui84@pnc.social", "Dhaka, Bangladesh", "Full Stack Developer at Samsung R&D Institute BD. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 7305));
        list.add(new UserData("Ahsan", "Munshi", "Ahsan Munshi", "ahsan.munshi85@pnc.social", "Dhaka, Bangladesh", "DevOps & Cloud Engineer at Augmedix Bangladesh. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 7390));
        list.add(new UserData("Faisal", "Kazi", "Faisal Kazi", "faisal.kazi86@pnc.social", "Dhaka, Bangladesh", "Engineering Manager at Portonics Limited. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 7475));
        list.add(new UserData("Maruf", "Barua", "Maruf Barua", "maruf.barua87@pnc.social", "Chittagong, Bangladesh", "Principal Systems Engineer at Techforce Bangladesh. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 7560));
        list.add(new UserData("Saqlain", "Paul", "Saqlain Paul", "saqlain.paul88@pnc.social", "Sylhet, Bangladesh", "Tech Lead at Inovace Technologies. Championing clean architecture, test-driven development, and reliable software delivery.", 7645));
        list.add(new UserData("Farabi", "Das", "Farabi Das", "farabi.das89@pnc.social", "Dhaka, Bangladesh", "Platform Engineer at Orbitax Bangladesh. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 7730));
        list.add(new UserData("Rayeed", "Biswas", "Rayeed Biswas", "rayeed.biswas90@pnc.social", "Gazipur, Bangladesh", "Site Reliability Engineer at Walton Hi-Tech R&D. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 7815));
        list.add(new UserData("Nashit", "Rahman", "Nashit Rahman", "nashit.rahman91@pnc.social", "Dhaka, Bangladesh", "QA Automation Lead at bKash Limited. Passionate about distributed systems, modern Java, and event-driven architectures. Building reliable systems at scale.", 7900));
        list.add(new UserData("Rupak", "Ahmed", "Rupak Ahmed", "rupak.ahmed92@pnc.social", "Dhaka, Bangladesh", "Data Platform Engineer at Pathao. Specializing in Spring Boot microservices, high-throughput PostgreSQL, and zero-trust security postures.", 7985));
        list.add(new UserData("Shahid", "Hossain", "Shahid Hossain", "shahid.hossain93@pnc.social", "Dhaka, Bangladesh", "Security & DevSecOps Engineer at Brain Station 23. Cloud infrastructure enthusiast. Focused on containerization, Kubernetes, CI/CD automation, and developer productivity.", 8070));
        list.add(new UserData("Saad", "Hasan", "Saad Hasan", "saad.hasan94@pnc.social", "Dhaka, Bangladesh", "Product Manager at ShopUp. Engineering leader with a passion for clean code, mentoring teams, and domain-driven design.", 8155));
        list.add(new UserData("Rafe", "Chowdhury", "Rafe Chowdhury", "rafe.chowdhury95@pnc.social", "Dhaka, Bangladesh", "Database Administrator at Chaldal. Full-stack craftsman bridging intuitive web interfaces with resilient, low-latency backend APIs.", 8240));
        list.add(new UserData("Wasi", "Islam", "Wasi Islam", "wasi.islam96@pnc.social", "Dhaka, Bangladesh", "Senior Java Developer at TigerIT Bangladesh. Obsessed with database tuning, query optimization, and resilient connection pooling under high load.", 325));
        list.add(new UserData("Ibtida", "Khan", "Ibtida Khan", "ibtida.khan97@pnc.social", "Dhaka, Bangladesh", "Lead Backend Engineer at Therap BD. DevOps advocate working on GitOps pipelines, Terraform, and automated observability platforms.", 410));
        list.add(new UserData("Anwar", "Haque", "Anwar Haque", "anwar.haque98@pnc.social", "Dhaka, Bangladesh", "Senior Software Engineer at Kaz Software. Championing clean architecture, test-driven development, and reliable software delivery.", 495));
        list.add(new UserData("Mizan", "Alam", "Mizan Alam", "mizan.alam99@pnc.social", "Dhaka, Bangladesh", "Software Architect at Optimizely BD. Passionate about Bangladesh's burgeoning tech scene and creating scalable digital products for millions.", 580));
        list.add(new UserData("Kamrul", "Karim", "Kamrul Karim", "kamrul.karim100@pnc.social", "Dhaka, Bangladesh", "Full Stack Developer at SELISE Digital Platforms. Focusing on high-volume payment processing, zero downtime deployments, and resilient API gateways.", 665));
        return list;
    }

    private List<String> getSeedPostTexts() {
        List<String> list = new ArrayList<>();
        list.add("When designing serverless architectures, connection pooling is often the silent killer. Connecting Spring Boot to Neon DB via a pooled endpoint (-pooler.neon.tech) guarantees that burst traffic from cold starts won't exhaust connection limits.");
        list.add("Never rely on client-side JavaScript validation for business logic. Anyone can craft a direct HTTP request or modify runtime variables in devtools. Strict backend validation with Jakarta Validation is mandatory.");
        list.add("Migrating binary file uploads directly to Cloudflare R2 using presigned PUT URLs freed up over 80% of our application heap memory. Keep your API servers handling JSON, not streaming raw megabytes.");
        list.add("Java 25's virtual threads are transformative. We replaced complex reactive programming paradigms with standard imperative code, achieving identical concurrency throughput with a fraction of the code complexity.");
        list.add("Composite indexes in PostgreSQL: always adhere to the leftmost prefix rule. If your query filters on (status = 'ACTIVE' AND created_at > ?), an index on (status, created_at) will be lightning fast.");
        list.add("A great engineering culture is built on blameless post-mortems. When production breaks, fix the guardrails and observability gaps rather than looking for someone to blame.");
        list.add("Decoupling frontend static assets from server-rendered JSP templates made our deployment cycle 5x faster. The browser serves cached HTML/CSS/JS instantly, and Spring Boot handles lightweight JSON REST endpoints.");
        list.add("Idempotency keys should be a hard requirement for all billing and wallet transaction APIs. In distributed systems, retries are inevitable. Protect your ledger from duplicate debits.");
        list.add("Render's free tier has strict 512MB RAM constraints. Tuning JVM memory with -XX:MaxRAMPercentage=65.0 and HikariCP maximumPoolSize=5 keeps Spring Boot lean and prevents OOM crashes.");
        list.add("Why you should embrace Java records for DTOs: immutability by default, concise boilerplate-free syntax, and seamless serialization across Spring Boot controllers.");
        list.add("Database migrations with Flyway or Liquibase give you predictable, version-controlled schema evolution across staging and production environments.");
        list.add("In high-concurrency systems, optimistic locking with a version field is significantly more scalable than pessimistic database locks.");
        list.add("Replacing legacy ThreadLocal contexts with Scoped Values in Java 25 provides safe, immutable cross-method context sharing without the risk of thread-pool memory leaks.");
        list.add("Don't build microservices until your domain boundaries are genuinely understood. A clean, modular monolith with distinct package encapsulation will take you surprisingly far.");
        list.add("Observability isn't just about logs. Correlation IDs propagated across HTTP headers and structured JSON logs allow you to trace user journeys through entire distributed systems.");
        list.add("Rate limiting at the gateway level is essential to protect public endpoints from credential stuffing and scraping bots. Token bucket algorithms work wonders.");
        list.add("Refactoring isn't a technical debt sprint item. It should be continuous Boy Scout hygiene—leave every file slightly cleaner than you found it.");
        list.add("Using Brevo's transactional REST API over standard SMTP completely bypasses outbound port 25/587 blocking on serverless container platforms like Render.");
        list.add("Code reviews should focus on architectural decisions, edge case handling, and test coverage—leave formatting and linting strictly to automated CI linters.");
        list.add("Exciting to see Bangladesh's fintech infrastructure handling millions of daily mobile wallet transactions with sub-second latencies. Engineering excellence in Dhaka is thriving!");
        list.add("When querying paginated lists in JPA, always use 'countQuery' hints or avoid fetching counts when infinite scroll only needs 'hasNext' via Slice rather than Page.");
        list.add("Caching without a well-defined TTL and invalidation strategy is just a memory leak in disguise. Keep your cache lifetimes short and strictly scoped.");
        list.add("Zero-trust security means treating internal network boundaries with the same skepticism as public traffic. Verify identity on every service hop.");
        list.add("Spring Security 6 with stateless sessions and cookie-based authentication provides a rock-solid foundation for modern decoupled single-page applications.");
        list.add("If your SQL queries are running slow, don't just add an index blindly. Run EXPLAIN (ANALYZE, BUFFERS) and inspect whether sequential scans or disk sorts are occurring.");
        list.add("Designing resilient webhooks: always store incoming webhook payloads in a staging table immediately, acknowledge with 200 OK, and process asynchronously in background workers.");
        list.add("The power of pattern matching in modern Java: exhaustive switch expressions replace brittle instanceof cascades with compiler-verified safety.");
        list.add("Pair programming on complex algorithmic refactorings often cuts implementation and review time in half while spreading architectural context across the team.");
        list.add("Why we transitioned our background workers to virtual threads: tasks that spend 90% of their time waiting on external HTTP APIs now consume almost zero OS thread resources.");
        list.add("Database deadlocks usually stem from inconsistent row lock ordering across concurrent transactions. Always acquire locks in deterministic alphabetical or chronological order.");
        list.add("Mentoring university interns in Dhaka this summer reminded me how important fundamental data structures and OS concepts are. Frameworks change, fundamentals remain.");
        list.add("Always sanitize all user-generated content before rendering. Even with modern frontend frameworks, malicious HTML/JS payloads can slip through if not properly escaped.");
        list.add("Event-driven architecture with Kafka: consumer lag is your most critical health metric. If lag grows during peak hours, your partition count and consumer group need rebalancing.");
        list.add("Flexible constructor bodies in Java 25 enable validating arguments and computing complex fields prior to invoking super(). Finally, cleaner OOP inheritance in Java!");
        list.add("Using Docker multi-stage builds reduced our production container image size from 800MB down to 180MB. Faster deployments and reduced attack surface.");
        list.add("API versioning best practice: URI path versioning (/api/v1/) is clear, easy to cache at CDN edges, and prevents breaking client changes.");
        list.add("Graceful degradation during traffic spikes: disable non-essential features (like recommendation feeds or analytics counters) to protect critical checkout and posting flows.");
        list.add("Cross-Site Request Forgery (CSRF) defense: using SameSite=Strict cookies combined with custom request headers ensures robust protection for stateless REST APIs.");
        list.add("In high-traffic e-commerce systems, database read replicas take the heat off your primary writer. Direct reporting and search queries to replicas.");
        list.add("A clean API response envelope with standard 'success', 'data', and 'error' keys makes frontend error handling consistent across every single page.");
        list.add("Automated integration tests with Testcontainers ensure your database queries, migrations, and constraint checks are verified against a real PostgreSQL instance in CI.");
        list.add("Why you should avoid returning JPA entities directly from REST controllers: entities expose internal schema details, cause lazy-loading exceptions, and risk unintentional updates.");
        list.add("Serverless databases like Neon scale to zero when idle, saving massive cloud costs for early-stage platforms. An initial cold-start loader keeps users informed while the cluster warms up.");
        list.add("The Bangladesh open source community has grown tremendously over the past three years. Sharing our tooling and libraries elevates the entire local ecosystem.");
        list.add("Always specify timeouts on HTTP client calls. An unconfigured connection timeout or socket timeout can easily freeze your thread pool when a third-party service lags.");
        list.add("Distributed locking with Redis Redlock or Postgres advisory locks: essential when multiple instances try to execute a scheduled cron job simultaneously.");
        list.add("Optimizing JVM garbage collection for small heap environments: using SerialGC or G1GC with tuned pause targets prevents stop-the-world spikes on free-tier servers.");
        list.add("Clean code tip: if a method takes more than three parameters, consider grouping them into a cohesive domain record or value object.");
        list.add("Cloudflare R2 provides S3-compatible object storage with zero egress fees—an absolute game-changer for media-heavy platforms operating on tight budgets.");
        list.add("Building scalable notification feeds: fan-out on write vs fan-out on read. For users with moderate followers, fan-out on read with indexed queries scales effortlessly.");
        list.add("Continuous integration should be fast. If your CI pipeline takes more than 10 minutes, developers stop waiting for results before switching contexts.");
        list.add("Never hardcode secrets or database credentials into source repositories. Leverage environment variables and secrets managers to safeguard production environments.");
        list.add("Database connection pool exhaustion is often caused by long-running transactions holding onto connections while doing external network calls. Always release connections before calling external APIs.");
        list.add("The shift toward cloud-native microservices has highlighted the importance of distributed tracing. OpenTelemetry has become the industry standard for observability.");
        list.add("Using Java's HttpClient with modern HTTP/2 multiplexing allows multiplexing multiple requests over a single TCP connection, reducing latency noticeably.");
        list.add("Database column indexing: beware of low cardinality columns (like boolean flags). Standard B-tree indexes on boolean columns are rarely used by the query planner unless combined with composite filters.");
        list.add("A well-crafted README and clean API documentation save countless hours of onboarding for new software engineers joining the team.");
        list.add("Writing idempotent database scripts ensures that rerunning a deployment migration after a partial failure will never corrupt existing data.");
        list.add("Don't optimize prematurely, but do establish performance benchmarks early. Knowing your baseline request latency makes spotting regressions straightforward.");
        list.add("Modular architecture enables multiple engineering squads in Dhaka and Chittagong to work in parallel without stepping on each other's toes.");
        list.add("Proper HTTP caching headers (Cache-Control: public, max-age=31536000, immutable) for static assets allow CDNs to absorb nearly 99% of your traffic.");
        list.add("Handling unexpected exceptions: a global @ControllerAdvice with structured error responses prevents stack traces from leaking to public clients.");
        list.add("High-performing teams prioritize psychological safety. Team members should feel comfortable asking questions and proposing bold refactorings.");
        list.add("The beauty of Spring Boot 3 is native AOT compilation with GraalVM. Lightning fast startup times and negligible memory footprints for microservices.");
        list.add("Clean domain modeling: keep your domain entities focused on business invariants and separate them from transport DTOs.");
        list.add("Automated database backups and regularly tested restore drills are non-negotiable. If you haven't tested your backup restore, you don't have backups.");
        list.add("Designing robust search: trigram indexes (pg_trgm) in PostgreSQL give you powerful fuzzy search capabilities without the operational overhead of a dedicated Elasticsearch cluster.");
        list.add("Frontend performance matters: optimizing CSS delivery, removing unused JavaScript libraries, and lazy-loading images keeps First Contentful Paint under 1 second.");
        list.add("API design: use proper HTTP status codes. 201 for Created, 204 for No Content, 400 for Bad Request, 401 for Unauthorized, 403 for Forbidden, and 404 for Not Found.");
        list.add("Refactoring legacy JSP scriptlets into clean static HTML with asynchronous REST calls is one of the most satisfying modernization projects an architect can undertake.");
        list.add("Handling high concurrency in mobile app backends: payload compression with gzip/brotli cuts mobile data usage significantly for users in Bangladesh.");
        list.add("Always set explicit database column lengths and nullability constraints. Defensive schema design prevents corrupt data from ever entering your tables.");
        list.add("A clean git commit history with descriptive messages makes debugging regressions using git bisect effortless.");
        list.add("Load testing your endpoints with tools like k6 or Gatling before launching marketing campaigns ensures your infrastructure handles traffic spikes smoothly.");
        list.add("Security check: ensure all session cookies are configured with HttpOnly, Secure, and SameSite attributes to defend against XSS token theft.");
        list.add("Distributed caching tip: use cache tags or versioned keys to invalidate related caches simultaneously without complex invalidation cascades.");
        list.add("Database vacuuming: monitoring dead tuples in PostgreSQL ensures table bloat doesn't quietly degrade query execution plans over time.");
        list.add("Great software architecture is not about anticipating every future feature; it is about creating systems that are easy to change when requirements evolve.");
        list.add("Java's modern pattern matching makes compiler-checked domain state transitions as expressive as functional languages like Kotlin and Scala.");
        list.add("Implementing exponential backoff with jitter on network retries prevents the thundering herd problem when downstream dependencies recover from downtime.");
        list.add("A robust test suite acts as living documentation for your system's business rules and edge-case behaviors.");
        list.add("Using Docker compose for local development ensures every team member runs identical database and dependency versions on their local machines.");
        list.add("Designing resilient web APIs: ensure all write endpoints validate payload size limits to avoid denial-of-service from massive JSON payloads.");
        list.add("Bangladesh's software exports are reaching new milestones every year. Proud of our tech leaders driving global innovation from Dhaka.");
        list.add("Database connection keep-alives prevent cloud firewalls from abruptly terminating idle database connections during inactive periods.");
        list.add("Keep your controllers thin and your services focused. Controllers should only validate requests, delegate to services, and map response DTOs.");
        list.add("The combination of Spring Boot 3, Java 25, Neon DB, and Cloudflare R2 provides a world-class, cost-effective modern cloud stack.");
        list.add("Continuous learning is the cornerstone of engineering growth. Dedicate time each week to exploring new language features and architectural patterns.");
        list.add("Defensive programming: validate method preconditions early and fail fast with clear, informative exception messages.");
        list.add("Building scalable multi-tenant platforms requires strict row-level security or tenant isolation filters on every single database query.");
        list.add("Using presigned GET URLs for private media access guarantees that only authorized users can view sensitive documents and photos.");
        list.add("Simplicity is the ultimate sophistication in software engineering. Avoid over-engineering solutions for problems your system doesn't have.");
        list.add("Real-time push notifications: WebSockets or Server-Sent Events (SSE) provide instant updates to users without battery-draining polling.");
        list.add("Monitoring database query latency with p95 and p99 percentiles gives a much more accurate picture of user experience than average response times.");
        list.add("Clean code is code that looks like it was written by someone who cares. Keep formatting consistent, logic readable, and comments meaningful.");
        list.add("Engineering resilience: design your system so that failure in a non-critical module (like an advertisement engine) never disrupts core user workflows.");
        list.add("Encapsulating legacy database queries with Spring Data JPA repositories improves maintainability and makes switching data sources seamless.");
        list.add("The journey of migrating a legacy monolith to a modern cloud-native architecture is challenging, but the resulting developer velocity and system stability are worth every hour.");
        list.add("Technology is ultimately about empowering people and culture. Building tools that connect coworkers, celebrate achievements, and drive innovation is what makes software engineering fulfilling.");
        list.add("Excited for the future of enterprise software engineering in Bangladesh. Continuous improvement, clean code, and zero-trust security will lead the way!");
        return list;
    }
}
