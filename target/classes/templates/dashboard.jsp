<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
    <head>
        <meta charset="UTF-8">
        <title>Certification Website</title>
        <link rel="stylesheet" href="/static/styles/dashboard.css">
        <script src="https://kit.fontawesome.com/1760d77ffa.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Encode+Sans+Condensed:wght@400;700&display=swap">
    </head>

    <body>
        <nav>
            <div class="Company-logo">
                <img src="/static/images/others/logo.png" alt="Company Logo">
            </div>
            <div class="nav-links Home">
                <a href="/">Home</a>
            </div>
            <div class="nav-links Catalog">
                <a href="/client/catalog">Certification Catalog</a>
            </div>
            <div class="nav-links Catalog">
                <a th:href="@{'/client/profile?email=' + ${client.email}}">Profile</a>
            </div>
            <div class="search-bar">
                <input type="text" id="search-input" class="search-bar-input" placeholder="What do you want to learn......">
                <ul id="search-suggestions" class="search-suggestions"></ul>
                <button class="search-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
            </div>
            <div class="user-circle" id="userCircle">
                <div class="user-initial">
                  <p th:text="${client != null ? client.email.substring(0,2).toUpperCase() : ''}"></p>
                </div>
                <div class="dropdown-content" id="dropdownContent">
                    <a href="/logout">Logout</a>
                </div>
            </div>
    
        </nav>

        <div class="sections-container">
            <div class="slide aws-slide active">
                <div style="display: flex; flex-direction: row; align-items: flex-start;">
                    <h3 style="font-family: Inter; font-size: 2.2em; margin-bottom: 10px;">AWS Certified Developer </br>Exam (DVA-CO2)</h3>
                    <ul style="list-style-type: disc; padding-left: 300px; font-size: 1.2em;">
                        <li>Contact Us</li>
                        <li>Study With us</li>
                        <li>Schedule</li>
                        <li>Get Certified</li>
                    </ul>
                    <img src="/static/images/others/aws_dev.png" alt="AWS Developer" class="aws-developer-image">
                </div>
            </div>
            <div class="slide red-hat-slide">
                <div style="display: flex; flex-direction: row; align-items: flex-start;">
                    <h3 style="font-family: Inter; font-size: 2.2em; margin-bottom: 10px;">Red Hat Certified Enterprise </br>Application Developer: EX183</h3>
                    <ul style="list-style-type: disc; padding-left: 175px; font-size: 1.2em;">
                        <li>Talk To us</li>
                        <li>Plan Your Schedule for </br>Red Hat EX183 Exam</li>
                        <li>Get Certified in Red Hat </br>EX183 Exam</li>
                    </ul>
                    <img src="/static/images/others/redhat_logo.png" alt="Red Hat" class="red-hat-image">
                </div>
            </div>
            <div class="slide google-cloud-slide">
                <div style="display: flex; flex-direction: row; align-items: flex-start;">
                    <h3 style="font-family: Inter; font-size: 2.2em; margin-bottom: 10px;">Google Professional Cloud <br>Developer (GCP PCD)</h3>
                    <ul style="list-style-type: disc; padding-left: 175px; font-size: 1.2em;">
                        <li>Meet us</li>
                        <li>Plan Your Schedule for </br>GCP Exam</li>
                        <li>Achieve GCP Professional</br>
                            Cloud Developer Certification</li>
                    </ul>
                    <img src="/static/images/others/gcb_badge.png" alt="Google Cloud" class="google-cloud-image">
                </div>
            </div>
            <div class="slide azure-slide">
                <div style="display: flex; flex-direction: row; align-items: flex-start;">
                    <h3 style="font-family: Inter; font-size: 2.2em; margin-bottom: 10px;">Microsoft AZ-400 :</br>
                        Devops Engineer Expert</h3>
                    <ul style="list-style-type: disc; padding-left: 175px; font-size: 1.2em;">
                        <li>Contact CertifyXpert</li>
                        <li>Plan Your Azure 400 </br>Learning Journey!</li>
                        <li>Achieve Azure 400 Certification </br>Excellence!</li>
                    </ul>
                    <img src="/static/images/others/azure_dev.png" alt="Azure Developer" class="azure-dev-image">
                </div>
            </div>
        </div>
        <div class="content">
            <div class="trending-heading-container">
                <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 20px;">Most Viewed Certifications:</p>
                <button id="trending-viewMoreButton" onclick="showMoreCards()">View More</button>
            </div>
            <div class="trending-certification-container">
                <div th:each="cert, iterStat : ${certifications}" th:if="${iterStat.index < 5}" class="trending-card-display">
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="trending-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p th:text="${cert.certificationLevel}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" th:data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span> 
                    </div>
                </div>
            </div>
            <!-- Foundational Level Certifications -->
            <div class="trending-heading-container">
                <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 20px;">Foundational Certifications:</p>
                <button id="trending-viewMoreButton" onclick="foundationPopup()">View More</button>
            </div>
            <div class="trending-certification-container">
                <div th:each="cert : ${certifications}" th:if="${cert.certificationLevel.toLowerCase() == 'foundation'}" class="trending-card-display">
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="trending-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p th:text="${cert.certificationLevel}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" th:data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span> 
                    </div>
                </div>
            </div>
            <div class="trending-heading-container">
                <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 10px;">Associate Certifications level:</p>
                <button id="trending-viewMoreButton" onclick="associatePopup()">View More</button>
            </div>
            <div class="trending-certification-container">
                <div th:each="cert : ${certifications}" th:if="${cert.certificationLevel.toLowerCase() == 'associate'}" class="trending-card-display">
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="trending-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p th:text="${cert.certificationLevel}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" th:data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span> 
                    </div>
                </div>
            </div>
            <!-- Professional Level Certifications -->
            <div class="trending-heading-container">
                <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 20px;">Professional Certifications:</p>
                <button id="trending-viewMoreButton" onclick="professionalPopup()">View More</button>
            </div>
            <div class="trending-certification-container">
                <div th:each="cert : ${certifications}" th:if="${cert.certificationLevel.toLowerCase() == 'professional'}" class="trending-card-display">
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="trending-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p th:text="${cert.certificationLevel}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" th:data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span> 
                    </div>
                </div>
            </div>
        </div>

        <div class="search-results">
            <div id="content-container"></div>
        </div>
        <!-- Display cards based on views -->
        <div id="moreCardsPopup" class="trending-popup">
            <span class="trending-close-button" onclick="hidePopup('moreCardsPopup')">&times;</span>
            <div class="trending-popup-certification-container">
                <div th:each="cert, iterStat : ${certifications}" th:if="${iterStat.index < 100000}" class="trending-popup-card-display">
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="trending-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p th:text="${cert.certificationLevel}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" th:data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span> 
                    </div>
                </div>
            </div>
        </div>
        <!-- Display cards based on Foundation level -->
        <div id="foundationCardsPopup" class="trending-popup">
            <span class="trending-close-button" onclick="hidePopup('foundationCardsPopup')">&times;</span>
            <div class="trending-popup-certification-container">
                <div th:each="cert : ${certifications}" th:if="${cert.certificationLevel.toLowerCase() == 'foundation'}" class="trending-card-display">
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="trending-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p th:text="${cert.certificationLevel}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" th:data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span> 
                    </div>
                </div>
            </div>
        </div>
        <!-- Display cards based on Associate level -->
        <div id="associateCardsPopup" class="trending-popup">
            <span class="trending-close-button" onclick="hidePopup('associateCardsPopup')">&times;</span>
            <div class="trending-popup-certification-container">
                <div th:each="cert : ${certifications}" th:if="${cert.certificationLevel.toLowerCase() == 'associate'}" class="trending-card-display">
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="trending-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p th:text="${cert.certificationLevel}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" th:data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span> 
                    </div>
                </div>
            </div>
        </div>
        <!-- Display cards based on Professional level -->
        <div id="professionalCardsPopup" class="trending-popup">
            <span class="trending-close-button" onclick="hidePopup('professionalCardsPopup')">&times;</span>
            <div class="trending-popup-certification-container">
                <div th:each="cert : ${certifications}" th:if="${cert.certificationLevel.toLowerCase() == 'professional'}" class="trending-card-display">
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="trending-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p th:text="${cert.certificationLevel}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" th:data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span> 
                    </div>
                </div>
            </div>
        </div>

        <div id="errorBar" class="error-bar">
            <p th:text="${error}"></p>
        </div>
    
        <div id="overlay"></div>

        <div class="contact-button" id="contactButton">
            <i class="fas fa-comment"></i>
        </div>
        <div class="contact-menu" id="contactMenu">
            <div class="contact-item" onclick="composeMail()"><i class="fas fa-envelope"></i></div>
            <div class="contact-item" onclick="openWhatsApp()"><i class="fas fa-phone"></i></div>
            <div class="contact-item" onclick="openTelegram()"><i class="fab fa-telegram"></i></div>
            <div class="contact-item" onclick="openGoogleMaps()"><i class="fas fa-map-marker-alt"></i></div>
        </div>
        <div class="notification-container" th:if="${unverifiedSubscriptions.size() > 0}" onclick="document.getElementById('notificationPopup').classList.toggle('show')">
            <i class="fa-regular fa-bell"></i>
            <span class="notification-count" th:text="${unverifiedSubscriptions.size()}"></span>
        </div>
        
        <div class="notification-popup" id="notificationPopup">
            <div th:each="sub, iterStat : ${unverifiedSubscriptions}">
                <div class="notification-item" th:classappend="${iterStat.index >= 3} ? 'more hidden' : ''">
                    <p class="notification-name" th:text="${sub.clientName}"></p>
                    <p class="notification-certification">
                        <span th:text="${sub.certificationName} + ' subscription has been verified'"></span>
                    </p>
                    <p class="notification-email">
                        <i class="fa-regular fa-envelope"></i>
                        <a th:href="'mailto:' + ${sub.clientEmail}" th:text="${sub.adminEmails}"></a>
                    </p>
                    <p class="notification-contact">
                        <i class="fa-brands fa-whatsapp"></i>
                        <a th:href="'https://wa.me/' + ${sub.clientContact}" th:text="${sub.clientContact}"></a>
                    </p>
                    <form th:action="@{/client/verifySubscription/{id}(id=${sub.id})}" method="post">
                        <button type="submit" class="no-queries-button">Acknowledged!</button>
                    </form>
                </div>
            </div>
            <div class="view-more" th:if="${unverifiedSubscriptions.size() > 3}">
                <button type="button" onclick="expandNotifications()">View More</button>
            </div>
        </div>
    
        <script>
            // JavaScript for automatic slideshow
            let currentSlide = 0;
            const slides = document.querySelectorAll('.slide');

            function showSlide(index) {
                slides.forEach((slide, i) => {
                    slide.classList.remove('active');
                    if (i === index) {
                        slide.classList.add('active');
                    }
                });
            }

            function nextSlide() {
                currentSlide = (currentSlide + 1) % slides.length;
                showSlide(currentSlide);
            }

            setInterval(nextSlide, 3000); // Change slide every 3 seconds

            function displayError(errorMessage) {
                var errorBar = document.getElementById('errorBar');
                errorBar.innerHTML = errorMessage;
                errorBar.style.display = 'block';
                setTimeout(function() {
                    errorBar.style.display = 'none';
                }, 3000); // Hide after 3 seconds
            }

            function toggleDropdown() {
                var dropdownContent = document.getElementById("dropdownContent");
                dropdownContent.parentElement.classList.toggle("show");
            }

            // Close the dropdown if the user clicks outside of it
            window.onclick = function(event) {
                if (!event.target.matches('.user-circle')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }

            function composeMail() {
                window.open("mailto:your-email@example.com", "_blank");
            }

            function openWhatsApp() {
                window.open("https://wa.me/+916303074568", "_blank");
            }

            function openTelegram() {
                window.open("https://telegram.me/TRIGUNTEJA", "_blank");
            }

            function openGoogleMaps() {
                window.open("https://www.google.com/maps/place/KL+Deemed+to+be+University/@16.4416131,80.6214974,17z/data=!3m1!4b1!4m5!3m4!1s0x3a35f4c1fd70cbef:0xacf32252d3434c68!8m2!3d16.441608!4d80.6236861", "_blank");
            }
            const contactButton = document.getElementById('contactButton');
            const contactMenu = document.getElementById('contactMenu');

            contactButton.addEventListener('mouseover', () => {
                contactMenu.style.opacity = 1;
                contactMenu.style.transform = 'scale(1)';
                contactMenu.style.pointerEvents = 'auto';
                contactButton.style.display = 'none';
            });

            contactMenu.addEventListener('mouseleave', () => {
                contactMenu.style.opacity = 0;
                contactMenu.style.transform = 'scale(0)';
                contactMenu.style.pointerEvents = 'none';
                contactButton.style.display = 'flex';
            });
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.trending-view-counter').forEach(function (element) {
                    var certificationName = element.getAttribute('data-cert-name');
                    fetch(`/client/view/count/${certificationName}`)
                        .then(response => response.json())
                        .then(data => {
                            element.querySelector('.view-count').innerText = data;
                        })
                        .catch(error => console.error('Error fetching view count:', error));
                });
            });
            function showMoreCards() {
                document.getElementById("moreCardsPopup").style.display = "block";
                document.getElementById("overlay").style.display = "block";
            }
            function foundationPopup() {
                document.getElementById("foundationCardsPopup").style.display = "block";
                document.getElementById("overlay").style.display = "block";
            }
            function associatePopup() {
                document.getElementById("associateCardsPopup").style.display = "block";
                document.getElementById("overlay").style.display = "block";
            }
            function professionalPopup() {
                document.getElementById("professionalCardsPopup").style.display = "block";
                document.getElementById("overlay").style.display = "block";
            }

            function hidePopup(popupId) {
                document.getElementById(popupId).style.display = "none";
                document.getElementById("overlay").style.display = "none";
            }

            document.getElementById("overlay").addEventListener('click', function() {
                hidePopup('moreCardsPopup');
                hidePopup('foundationCardsPopup');
                hidePopup('associateCardsPopup');
                hidePopup('professionalCardsPopup');
            });
            function expandNotifications() {
                document.getElementById('notificationPopup').classList.add('expanded');
                var hiddenItems = document.querySelectorAll('.notification-item.hidden');
                hiddenItems.forEach(function(item) {
                    item.classList.remove('hidden');
                });
                document.querySelector('.view-more').style.display = 'none';
            }
            /*for searching*/
            document.addEventListener('DOMContentLoaded', () => {
            const searchInput = document.getElementById('search-input');
            const searchSuggestions = document.getElementById('search-suggestions');
            const contentContainer = document.getElementById('content-container');
            const contentDiv = document.querySelector('.content');
            const searchResultsDiv = document.querySelector('.search-results');
            let suggestions = [];
            let selectedIndex = -1;

            searchInput.addEventListener('input', () => {
                const query = searchInput.value.trim().toLowerCase();
                searchSuggestions.innerHTML = '';
                if (query.length < 2) {
                    contentDiv.style.display = 'block';
                    searchResultsDiv.style.display = 'none';
                    return;
                }

                fetch(`/searchSuggestions?query=${query}`)
                    .then(response => response.json())
                    .then(data => {
                        suggestions = data;
                        if (suggestions.length > 0) {
                            suggestions.forEach((cert, index) => {
                                const li = document.createElement('li');
                                li.textContent = `${cert.certificationName} - ${cert.organizationName}`;
                                li.dataset.index = index;
                                li.addEventListener('mouseenter', () => {
                                    updateHighlightedSuggestion(index);
                                });
                                li.addEventListener('click', () => {
                                    searchInput.value = cert.certificationName;
                                    searchSuggestions.innerHTML = '';
                                    fetchAndDisplayCards(cert.certificationName);
                                });
                                searchSuggestions.appendChild(li);
                            });
                        } else {
                            const li = document.createElement('li');
                            li.textContent = 'No suggestions found';
                            searchSuggestions.appendChild(li);
                        }
                    });

                contentDiv.style.display = 'none';
                searchResultsDiv.style.display = 'block';
            });

            searchInput.addEventListener('keydown', (event) => {
                const suggestionsList = searchSuggestions.querySelectorAll('li');
                if (event.key === 'ArrowDown') {
                    if (selectedIndex < suggestionsList.length - 1) {
                        selectedIndex++;
                        updateHighlightedSuggestion(selectedIndex);
                    }
                } else if (event.key === 'ArrowUp') {
                    if (selectedIndex > 0) {
                        selectedIndex--;
                        updateHighlightedSuggestion(selectedIndex);
                    }
                } else if (event.key === 'Enter') {
                    if (selectedIndex >= 0) {
                        searchInput.value = suggestions[selectedIndex].certificationName;
                        searchSuggestions.innerHTML = '';
                        fetchAndDisplayCards(suggestions[selectedIndex].certificationName);
                    } else {
                        fetchAndDisplayCards(searchInput.value.trim());
                    }
                }
            });

            document.addEventListener('click', (event) => {
                if (!event.target.closest('.search-bar')) {
                    searchSuggestions.innerHTML = '';
                }
            });

            const updateHighlightedSuggestion = (index) => {
                const suggestionsList = searchSuggestions.querySelectorAll('li');
                suggestionsList.forEach((li, idx) => {
                    if (idx === index) {
                        li.classList.add('highlighted');
                        searchInput.value = suggestions[idx].certificationName;
                        displayCardPreview(suggestions[idx]);
                    } else {
                        li.classList.remove('highlighted');
                    }
                });
            };

            const displayCardPreview = (cert) => {
                contentContainer.innerHTML = ''; // Clear existing preview
                const card = document.createElement('div');
                card.className = 'trending-card-display';
                card.innerHTML = `
                    <div class="trending-cert-info-logo">
                        <div class="trending-cert-org-logo">
                            <img src="/static/images/${cert.organizationName.toLowerCase()}/${cert.organizationName.toLowerCase()}_logo.png" alt="${cert.organizationName} Logo">
                        </div>
                        <div class="trending-cert-badg-logo">
                            <img src="/static/images/${cert.organizationName.toLowerCase()}/${cert.certificationName.toLowerCase().replace(/\s/g, '_')}.png" alt="${cert.certificationName} Badge">
                        </div>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Name:</h3>
                        <p>${cert.certificationName}</p>
                    </div>
                    <div class="trending-cert-info">
                        <h3>Certification Level:</h3>
                        <p>${cert.certificationLevel}</p>
                    </div>
                    <a href="/client/view/certification/${cert.certificationName}" class="trending-view-course-button">View Details</a>
                    <div class="trending-view-counter" data-cert-name="${cert.certificationName}">
                        <i class="fas fa-eye"></i><span class="view-count">0</span>
                    </div>
                `;
                contentContainer.appendChild(card);
            };

            const fetchAndDisplayCards = (query) => {
                fetch(`/searchResults?query=${query}`)
                    .then(response => response.json())
                    .then(data => {
                        contentContainer.innerHTML = ''; // Clear existing cards
                        data.forEach(cert => {
                            const card = document.createElement('div');
                            card.className = 'trending-card-display';
                            card.innerHTML = `
                                <div class="trending-cert-info-logo">
                                    <div class="trending-cert-org-logo">
                                        <img src="/static/images/${cert.organizationName.toLowerCase()}/${cert.organizationName.toLowerCase()}_logo.png" alt="${cert.organizationName} Logo">
                                    </div>
                                    <div class="trending-cert-badg-logo">
                                        <img src="/static/images/${cert.organizationName.toLowerCase()}/${cert.certificationName.toLowerCase().replace(/\s/g, '_')}.png" alt="${cert.certificationName} Badge">
                                    </div>
                                </div>
                                <div class="trending-cert-info">
                                    <h3>Certification Name:</h3>
                                    <p>${cert.certificationName}</p>
                                </div>
                                <div class="trending-cert-info">
                                    <h3>Certification Level:</h3>
                                    <p>${cert.certificationLevel}</p>
                                </div>
                                <a href="/client/view/certification/${cert.certificationName}" class="trending-view-course-button">View Details</a>
                                <div class="trending-view-counter" data-cert-name="${cert.certificationName}">
                                    <i class="fas fa-eye"></i><span class="view-count">0</span>
                                </div>
                            `;
                            contentContainer.appendChild(card);
                        });
                    });
            };

            document.querySelector('.search-icon').addEventListener('click', () => {
                fetchAndDisplayCards(searchInput.value.trim());
            });
        });

        </script>
    </body>
</html>
