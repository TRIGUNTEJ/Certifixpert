<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Certification Website</title>
    <link rel="stylesheet" href="/static/styles/view.css">
    <script src="https://kit.fontawesome.com/1760d77ffa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Encode+Sans+Condensed:wght@400;700&display=swap">
    
</head>

<body> 
    <div id="registerPopup" class="regpopup" onmousedown="dragElement(this)">
        <div class="admin-register-form">
            <span class="close-button" onclick="hidePopup('registerPopup')">&times;</span>
            <h2 style="font-size: 1.3em; text-align: center;" onmousedown="startDrag(event)">Sign Up</h2>
            <form action="/admin/register" method="post">
                <label for="email">Admin Email:</label>
                <input type="text" id="email" name="email" required>
                <label for="password">Admin Password:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit" id="register-button" class="register-button">Sign Up</button>
            </form>
        </div>
    </div>
    <div class="admin-background-bar">
        <a href="javascript:history.back()" class="admin-back-button">
            <i class="fas fa-arrow-left"></i>
            Back
        </a>
    </div>
    
    <div class="content">
        <div class="organization-logo">
            <img th:if="${certification.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
            <img th:if="${certification.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="AWS Logo">
            <img th:if="${certification.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="AWS Logo">
            <img th:if="${certification.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="AWS Logo">  
        </div>
        
        <div class="certification-header">
            <h1 th:text="${certification.certificationName}" class="certification-name"></h1>
            <p th:text="':' + ' '+ ${certification.certificationCode}" class="certification-code"></p>
        </div>
        <div class="certification-info">
            <div class="exam-details">
                <div class="info-section">
                    <h2><i class="far fa-clock"></i> Duration</h2>
                    <p th:text="${certification.duration}"></p>
                </div>
                <div class="info-section">
                    <h2><i class="fas fa-check-circle"></i> Passing Score</h2>
                    <p th:text="${certification.passingScore}"></p>
                </div>
                <div class="info-section">
                    <h2><i class="far fa-calendar-alt"></i> Validity Period</h2>
                    <p th:text="${certification.validityPeriod}"></p>
                </div>
                <div class="info-section">
                    <h2><i class="fas fa-question-circle"></i> Exam Format</h2>
                    <p th:text="${certification.examFormat}"></p>
                 </div>
            </div>
        </div>
        <div class="certification-description">
            <div class="certification-image">
		        <img th:if="${certification.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Logo">
                <img th:if="${certification.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Logo">
                <img th:if="${certification.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="AWS Logo">
                <img th:if="${certification.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="AWS Logo">
                <img th:if="${certification.certificationName.toLowerCase() == 'enterprisedeveloper'}" src="/static/images/RedHat/Red_Ex183.png" alt="AWS Logo">
                <img th:if="${certification.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
            </div>
            <div class = "description-container1">
                  <p class="description-paragraph" th:text="${certification.description1}"></p>
            </div>
            <div class = "description-container2">
                  <p class="description-paragraph" th:text="${certification.description2}"></p>
            </div>
            <div class = "description-container3">
                  <p class="description-paragraph" th:text="${certification.description3}"></p>
            </div>
        </div>
 <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
    <div class="admins-heading-container">
        <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 10px;">Certified Trainers:</p>
        <button id="admin-viewMoreButton" onclick="showMoreCards()">View More</button>
    </div>
    <div class="certified-admins">
        <div class="certification-details" th:each="certWithAdmin : ${certifications}" th:if="${certWithAdmin.certification.certificationName.toLowerCase() == certification.certificationName.toLowerCase()}">
            <div class="certification-date" th:text="${certWithAdmin.certification.yearOfCertified}">Date of Certification</div>
            <div class="admin-info">
                <div class="admin-info-left">
                    <p class="admin-name" th:text="${certWithAdmin.admin.name}">Name</p>
                    <p class="admin-email">
                        <i class="fas fa-envelope"></i>
                        <a th:href="'mailto:' + ${certWithAdmin.admin.email}" th:text="${certWithAdmin.admin.email}">Admin Email</a>
                    </p>
                    <p class="admin-certid" th:text="${certWithAdmin.certification.certificateId}">Certification ID</p>
                </div>
                <div class="admin-info-right">
                    <div class="score-meter" th:data-percentage="${certWithAdmin.percentage}">
                        <svg width="100" height="100">
                            <circle cx="50" cy="50" r="40" stroke="#e6e6e6" stroke-width="10" fill="none"></circle>
                            <circle class="progress-circle" cx="50" cy="50" r="40" fill="none" stroke-width="10"></circle>
                        </svg>
                        <div class="percentage" th:text="${certWithAdmin.percentage} + '%'"></div>
                    </div>
                </div>                                                         
            </div>
        </div>
    </div>
    <div id="moreCardsPopup" class="admin-popup">
        <span class="admin-close-button" onclick="hidePopup('moreCardsPopup')">&times;</span>
        <div class="certified-admins-popup">
            <div class="certification-details-popup" th:each="certWithAdmin : ${certifications}" th:if="${certWithAdmin.certification.certificationName.toLowerCase() == certification.certificationName.toLowerCase()}">
                <div class="certification-date" th:text="${certWithAdmin.certification.yearOfCertified}">Date of Certification</div>
                <div class="admin-info">
                    <div class="admin-info-left">
                        <p class="admin-name" th:text="${certWithAdmin.admin.name}">Name</p>
                        <p class="admin-email">
                            <i class="fas fa-envelope"></i>
                            <a th:href="'mailto:' + ${certWithAdmin.admin.email}" th:text="${certWithAdmin.admin.email}">Admin Email</a>
                        </p>
                        <p class="admin-certid" th:text="${certWithAdmin.certification.certificateId}">Certification ID</p>
                    </div>
                    <div class="admin-info-right">
                        <div class="score-meter" th:data-percentage="${certWithAdmin.percentage}">
                            <svg width="100" height="100">
                                <circle cx="50" cy="50" r="40" stroke="#e6e6e6" stroke-width="10" fill="none"></circle>
                                <circle class="progress-circle" cx="50" cy="50" r="40" fill="none" stroke-width="10"></circle>
                            </svg>
                            <div class="percentage" th:text="${certWithAdmin.percentage} + '%'"></div>
                        </div>
                    </div>                                                         
                </div>
            </div>
        </div>
    </div>
    <div class = view-header>
        <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 10px;">Subcriptions:</p>
        <div class="view-link" onclick="showCertificationPopup()">View More</div>
    </div>
    
    <div class="view-certification-container">
        <div class="view-card-display" th:each="cert : ${subscriptions} " th:if="${cert.certificationName.toLowerCase() == certification.certificationName.toLowerCase()}">
            <div class="view-cert-info-logo">
                <div class="view-cert-org-logo">
                    <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                    <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                    <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                    <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                </div> 
                <div class="view-cert-badg-logo">
                    <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                    <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                    <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                    <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                    <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                    <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                </div>
            </div>
            <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;" th:text="${cert.clientName}"></p>
            <div class="view-cert-info">
                <h3>Certification Name:</h3>
                <p th:text="${cert.certificationName}"></p>
            </div>
            <div class="view-cert-info">
                <h3>Trainer Mail:</h3>
                <p th:text="${cert.adminEmails}"></p>
            </div>
            </div>
        </div>
    </div>
    <div id="view-certification-popup" class="view-popup">
        <span class="view-close-button" onclick="hidePopup('view-certification-popup')">&times;</span>
        <div class="view-popup-certification-container">
            <div class="view-popup-card-display" th:each="cert : ${subscriptions} " th:if="${cert.certificationName.toLowerCase() == certification.certificationName.toLowerCase()}">
                <div class="view-cert-info-logo">
                    <div class="view-cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                    </div> 
                    <div class="view-cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                    </div>
                </div>
                <div class="view-cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="view-cert-info">
                    <h3>Trainer Mail:</h3>
                    <p th:text="${cert.adminEmails}"></p>
                </div>
                </div>
            </div>
        </div>
    </div>

</div>

    </div>
                
    <div id="overlay"></div>
    
    <script>    
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
        function showSignUpPopup() {
            document.getElementById("registerPopup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }
        function showMoreCards() {
            document.getElementById("moreCardsPopup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }
        function hidePopup(popupId) {
        document.getElementById(popupId).style.display = 'none';
        document.getElementById("overlay").style.display = 'none';
        }
        window.onclick = function (event) {
        const registerPopup = document.getElementById('registerPopup');
        const signUpBtn = document.getElementById('SignUpBtn');
        const moreCardsPopup = document.getElementById('moreCardsPopup')

        if (event.target === registerPopup) {
            hidePopup('registerPopup');
            document.getElementById("overlay").style.display = "none";
        }
        if (event.target === moreCardsPopup) {
            hidePopup('moreCardsPopup');
            document.getElementById("overlay").style.display = "none";
        }

        if (event.target === signUpBtn) {
            showSignUpPopup();
        }

        if (event.target === certificationPopup) {
            hidePopup('certificationPopup');
            document.getElementById("overlay").style.display = "none";
        }
        
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
    };
        let offsetX, offsetY, isDragging = false;

        function startDrag(e) {
            e.preventDefault();
            offsetX = e.clientX;
            offsetY = e.clientY;
            isDragging = true;
        }

        function dragElement(elmnt) {
            document.onmouseup = function() {
                isDragging = false;
            };

            document.onmousemove = function(e) {
                if (isDragging) {
                    const dx = e.clientX - offsetX;
                    const dy = e.clientY - offsetY;
                    offsetX = e.clientX;
                    offsetY = e.clientY;

                    elmnt.style.left = elmnt.offsetLeft + dx + 'px';
                    elmnt.style.top = elmnt.offsetTop + dy + 'px';
                }
            };
        }  
        document.addEventListener("DOMContentLoaded", function() {
            var scoreMeters = document.querySelectorAll(".score-meter");

            scoreMeters.forEach(function(scoreMeter) {
                var progressCircle = scoreMeter.querySelector(".progress-circle");
                var percentageElement = scoreMeter.querySelector(".percentage");
                var percentage = parseFloat(scoreMeter.getAttribute("data-percentage"));
                var currentPercentage = 0;
                var interval = 10; // Interval in milliseconds, more frequent updates
                var totalAnimationDuration = 2000; // Total animation duration in milliseconds
                var steps = totalAnimationDuration / interval;
                var increment = percentage / steps;
                var strokeDasharray = 2 * Math.PI * 40; // Circumference of the circle (2 * π * r)
                progressCircle.style.strokeDasharray = strokeDasharray;

                function updateStrokeColor() {
                    // Update the color from green to darker green
                    var r = Math.floor(107 + (35 * currentPercentage / 100));
                    var g = Math.floor(198 - (45 * currentPercentage / 100));
                    var b = 107;
                    progressCircle.setAttribute("stroke", `rgb(${r},${g},${b})`);
                }

                function animate() {
                    if (currentPercentage >= percentage) {
                        currentPercentage = percentage;
                        clearInterval(timer);
                    } else {
                        currentPercentage += increment;
                    }
                    progressCircle.style.strokeDashoffset = strokeDasharray - (strokeDasharray * currentPercentage / 100);
                    percentageElement.innerText = currentPercentage.toFixed(2) + '%';
                    updateStrokeColor();
                }

                var timer = setInterval(animate, interval);
            });
        });
        function showCertificationPopup() {
            document.getElementById("view-certification-popup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        } 
         
    </script>
</body>
</html>
