<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Certification Website</title>
    <link rel="stylesheet" href="/static/styles/catalog.css">
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
            <a href="#">Certification Catalog</a>
        </div>
        <div class="nav-links Catalog">
            <a th:href="@{'/client/profile?email=' + ${client.email}}">Profile</a>
        </div>
        <div class="search-bar">
            <input type="text" class="search-bar-input" placeholder="What do you want to learn......">
            <button class = "search-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
        <div class="user-circle" id="userCircle">
		    <div class="user-initial">
              <p th:text="${client != null ? client.email.substring(0,2).toUpperCase() : ''}"></p>
            </div>

		    <!-- Dropdown content -->
		    <div class="dropdown-content" id="dropdownContent">
		        <a href="/logout">Logout</a>
		    </div>
		</div>

    </nav>

    <div class="background-bar"></div>
    <div class="content">
        <div class="certification-heading-container">
            <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 20px;">AWS Certifications:</p>
            <button id="viewMoreButton" onclick="showAwsCards()">View More</button>
        </div>        
        <div class="certification-container">
            <div th:each="cert : ${certifications}" th:if="${cert.organizationName.toLowerCase() == 'aws'}" class="card-display">
                <div class="cert-info-logo">
                    <div class="cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="AWS Logo">
                    </div> 
                    <div class="cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                    </div>
                </div>
                <div class="cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="cert-info">
                    <h3>Certification Level:</h3>
                    <p th:text="${cert.certificationLevel}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class ="view-course-button">View Details</a>
                <div class="view-counter" th:data-cert-name="${cert.certificationName}">
                    <i class="fas fa-eye"></i><span class="view-count">0</span> 
                </div>
			</div>
        </div>
        	<!-- google content -->
        <div class="certification-heading-container">
            <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 10px;">Google Certifications:</p>
            <button id="viewMoreButton" onclick="showGoogleCards()">View More</button>
        </div>        
        <div class="certification-container">
            <div th:each="cert : ${certifications}" th:if="${cert.organizationName.toLowerCase() == 'google'}" class="card-display">
                <div class="cert-info-logo">
                    <div class="cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="AWS Logo">
                    </div> 
                    <div class="cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="AWS Logo">
                    </div>
                </div>
                <div class="cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="cert-info">
                    <h3>Certification Level:</h3>
                    <p th:text="${cert.certificationLevel}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class ="view-course-button">View Details</a>
                <div class="view-counter" th:data-cert-name="${cert.certificationName}">
                    <i class="fas fa-eye"></i><span class="view-count">0</span> 
                </div>
			</div>
        </div>
        	<!-- microsoft content -->
        <div class="certification-heading-container">
            <p style="font-size: 1.6em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 1px;">Microsoft Certifications:</p>
            <button id="viewMoreButton" onclick="showMicrosoftCards()">View More</button>
        </div>        
        <div class="certification-container">
            <div th:each="cert : ${certifications}" th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" class="card-display">
                <div class="cert-info-logo">
                    <div class="cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="AWS Logo">
                    </div> 
                    <div class="cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="AWS Logo">
                    </div>
                </div>
                <div class="cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="cert-info">
                    <h3>Certification Level:</h3>
                    <p th:text="${cert.certificationLevel}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class ="view-course-button">View Details</a>
                <div class="view-counter" th:data-cert-name="${cert.certificationName}">
                    <i class="fas fa-eye"></i><span class="view-count">0</span> 
                </div>
			</div>
        </div>
       <!-- redhat content -->
        <div class="certification-heading-container">
            <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 10px;">RedHat Certifications:</p>
            <button id="viewMoreButton" onclick="showRedhatCards()">View More</button>
        </div>        
        <div class="certification-container">
            <div th:each="cert : ${certifications}" th:if="${cert.organizationName.toLowerCase() == 'redhat'}" class="card-display">
                <div class="cert-info-logo">
                    <div class="cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="AWS Logo">
                    </div> 
                    <div class="cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="AWS Logo">
                    </div>
                </div>
                <div class="cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="cert-info">
                    <h3>Certification Level:</h3>
                    <p th:text="${cert.certificationLevel}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class ="view-course-button">View Details</a>
                <div class="view-counter" th:data-cert-name="${cert.certificationName}">
                    <i class="fas fa-eye"></i><span class="view-count">0</span> 
                </div>
			</div>
        </div>
    </div>
    <!-- Display cards based on AWS -->
    <div id="AwsCardsPopup" class="certification-popup">
        <span class="certification-close-button" onclick="hidePopup('AwsCardsPopup')">&times;</span>
        <div class="certification-popup-certification-container">
            <div th:each="cert : ${certifications}" th:if="${cert.organizationName.toLowerCase() == 'aws'}" class="certification-popup-card-display">
                <div class="cert-info-logo">
                    <div class="cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                    </div> 
                    <div class="cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Logo">
                    </div>
                </div>
                <div class="cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="cert-info">
                    <h3>Certification Level:</h3>
                    <p th:text="${cert.certificationLevel}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="view-course-button">View Details</a>
                <div class="view-counter" th:data-cert-name="${cert.certificationName}">
                    <i class="fas fa-eye"></i><span class="view-count">0</span> 
                </div>
            </div>
        </div>
    </div>
    <!-- Display cards based on google -->
    <div id="GoogleCardsPopup" class="certification-popup">
        <span class="certification-close-button" onclick="hidePopup('GoogleCardsPopup')">&times;</span>
        <div class="certification-popup-certification-container">
            <div th:each="cert : ${certifications}" th:if="${cert.organizationName.toLowerCase() == 'google'}" class="certification-popup-card-display">
                <div class="cert-info-logo">
                    <div class="cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                    </div> 
                    <div class="cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                    </div>
                </div>
                <div class="cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="cert-info">
                    <h3>Certification Level:</h3>
                    <p th:text="${cert.certificationLevel}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="view-course-button">View Details</a>
                <div class="view-counter" th:data-cert-name="${cert.certificationName}">
                    <i class="fas fa-eye"></i><span class="view-count">0</span> 
                </div>
            </div>
        </div>
    </div>
    <!-- Display cards based on Microsoft -->
    <div id="MicrosoftCardsPopup" class="certification-popup">
        <span class="certification-close-button" onclick="hidePopup('MicrosoftCardsPopup')">&times;</span>
        <div class="certification-popup-certification-container">
            <div th:each="cert : ${certifications}" th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" class="certification-popup-card-display">
                <div class="cert-info-logo">
                    <div class="cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                    </div> 
                    <div class="cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Google Badge">
                    </div>
                </div>
                <div class="cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="cert-info">
                    <h3>Certification Level:</h3>
                    <p th:text="${cert.certificationLevel}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="view-course-button">View Details</a>
                <div class="view-counter" th:data-cert-name="${cert.certificationName}">
                    <i class="fas fa-eye"></i><span class="view-count">0</span> 
                </div>
            </div>
        </div>
    </div>
    <!-- Display cards based on Redhat -->
    <div id="RedhatCardsPopup" class="certification-popup">
        <span class="certification-close-button" onclick="hidePopup('RedhatCardsPopup')">&times;</span>
        <div class="certification-popup-certification-container">
            <div th:each="cert : ${certifications}" th:if="${cert.organizationName.toLowerCase() == 'redhat'}" class="certification-popup-card-display">
                <div class="cert-info-logo">
                    <div class="cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                    </div> 
                    <div class="cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                    </div>
                </div>
                <div class="cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="cert-info">
                    <h3>Certification Level:</h3>
                    <p th:text="${cert.certificationLevel}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="view-course-button">View Details</a>
                <div class="view-counter" th:data-cert-name="${cert.certificationName}">
                    <i class="fas fa-eye"></i><span class="view-count">0</span> 
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
        document.addEventListener('DOMContentLoaded', function () {
            document.querySelectorAll('.view-counter').forEach(function (element) {
                var certificationName = element.getAttribute('data-cert-name');
                fetch(`/client/view/count/${certificationName}`)
                    .then(response => response.json())
                    .then(data => {
                        element.querySelector('.view-count').innerText = data;
                    })
                    .catch(error => console.error('Error fetching view count:', error));
            });
        });
        function showAwsCards() {
                document.getElementById("AwsCardsPopup").style.display = "block";
                document.getElementById("overlay").style.display = "block";
            }
            function showGoogleCards() {
                document.getElementById("GoogleCardsPopup").style.display = "block";
                document.getElementById("overlay").style.display = "block";
            }
            function showMicrosoftCards() {
                document.getElementById("MicrosoftCardsPopup").style.display = "block";
                document.getElementById("overlay").style.display = "block";
            }
            function showRedhatCards() {
                document.getElementById("RedhatCardsPopup").style.display = "block";
                document.getElementById("overlay").style.display = "block";
            }

            function hidePopup(popupId) {
                document.getElementById(popupId).style.display = "none";
                document.getElementById("overlay").style.display = "none";
            }

            document.getElementById("overlay").addEventListener('click', function() {
                hidePopup('AwsCardsPopup');
                hidePopup('GoogleCardsPopup');
                hidePopup('MicrosoftCardsPopup');
                hidePopup('RedhatCardsPopup');
            });

    </script>
    
    
</body>
</html>
