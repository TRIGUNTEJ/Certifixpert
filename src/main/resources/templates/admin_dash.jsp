<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Certification Website</title>
    <link rel="stylesheet" href="/static/styles/admin.css">
    <script src="https://kit.fontawesome.com/1760d77ffa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Encode+Sans+Condensed:wght@400;700&display=swap">
</head>

<body>
    <nav>
        <div class="Company-logo">
            <img src="/static/images/others/logo.png" alt="Company Logo">
        </div>
        <div class="nav-links Home">
            <a href="/admin/dashboard" style="font-family: 'Open Sans', sans-serif; font-weight: 500; text-decoration: none; color: inherit;">Home</a>
        </div>
      
        
        <div class="nav-links Catalog">
            <a href="/admin/catalog">Certification Catalog</a>
        </div>

        <div class="nav-links Admin">
            <a href="javascript:void(0);" id ="SignUpBtn" onclick="showSignUpPopup()">Add Admin</a>
        </div>

        <div class="nav-links Profile">
            <a th:href="@{'/admin/profile?email=' + ${admin.email}}">Profile</a>
        </div>

        <div class="search-bar">
            <input type="text" class="search-bar-input" placeholder="What do you want to learn......">
            <button class = "search-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>

        <div class="user-circle" id="userCircle">
		    <div class="user-initial">
              <p th:text="${admin != null ? admin.email.substring(0,2).toUpperCase() : ''}"></p>
            </div>

		    <div class="dropdown-content" id="dropdownContent">
		        <a href="/logout">Logout</a>
		    </div>
		</div>
    </nav>
    
    
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
    
     <!-- Certification Popup -->
     <div id="certificationPopup" class="certpopup" onmousedown="dragElement(this)">
        <div class="certification-form">
            <span class="close-button" onclick="hidePopup('certificationPopup')">&times;</span>
            <h2 style="font-size: 1.3em; text-align: center;" onmousedown="startDrag(event)">Certification Details</h2>
            <form action="/certification/add" method="post">
                <label for="organizationName">Organization Name:</label>
                <input type="text" id="organizationName" name="organizationName" required>
                <button type="submit" id="addCertificationButton" class="add-certification-button">Add Organizaton</button>
            </form>
        </div>
    </div>
   
    

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

        <div class="section2">
            <h2>Xplore CertifyXpert's custom online certification courses:</h2>
            <p style="font-size: 1.1em;">Access education at your convenience, regardless of your location, and set your own pace with CertifyXpert. <br>
                Our meticulously crafted, tailored programs ensure a highly personalized learning experience, providing 
                you with the expertise you need to excel in your field.</p>
        </div>

        <div class="section3">
            <h2 style="color: #888;">Leading Certification Providers:</h2>
            <div class="logo-container">
                <img src="/static/images/others/aws_logo.png" alt="AWS Logo">
                <img src="/static/images/others/googlecloud_logo.png" alt="Google Cloud Logo">
                <img src="/static/images/others/azure_logo.png" alt="Azure Logo">
                <img src="/static/images/others/redhat_logo.png" alt="Red Hat Logo">
            </div>
        </div>
    </div>
    
    <div id="errorBar" class="error-bar">
          <p th:text="${error}"></p>
    </div>
    
    <div id="overlay"></div>
    <div class="notification-container" th:if="${unverifiedSubscriptions.size() > 0}" onclick="document.getElementById('notificationPopup').classList.toggle('show')">
        <i class="fa-regular fa-bell"></i>
        <span class="notification-count" th:text="${unverifiedSubscriptions.size()}"></span>
    </div>
    
    <div class="notification-popup" id="notificationPopup">
        <div th:each="sub, iterStat : ${unverifiedSubscriptions}">
            <div class="notification-item" th:classappend="${iterStat.index >= 3} ? 'more hidden' : ''">
                <p class="notification-name" th:text="${sub.clientName}"></p>
                <p class="notification-certification">has subscribed to <span th:text="${sub.certificationName}"></span></p>
                <p class="notification-email">
                    <i class="fa-regular fa-envelope"></i>
                    <a th:href="'mailto:' + ${sub.clientEmail}" th:text="${sub.clientEmail}"></a>
                </p>
                <p class="notification-contact">
                    <i class="fa-brands fa-whatsapp"></i>
                    <a th:href="'https://wa.me/' + ${sub.clientContact}" th:text="${sub.clientContact}"></a>
                </p>
                <form th:action="@{/admin/verifySubscription/{id}(id=${sub.id})}" method="post">
                    <button type="submit" class="no-queries-button">No Queries</button>
                </form>
            </div>
        </div>
        <div class="view-more" th:if="${unverifiedSubscriptions.size() > 3}">
            <button type="button" onclick="expandNotifications()">View More</button>
        </div>
    </div>
    
    
    
    <script>
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
    
        setInterval(nextSlide, 3000); 
    
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
        function showSignUpPopup() {
            document.getElementById("registerPopup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }
        function hidePopup(popupId) {
        document.getElementById(popupId).style.display = 'none';
        document.getElementById("overlay").style.display = 'none';
        }
        function showCertificationPopup() {
            document.getElementById("certificationPopup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }

        window.onclick = function (event) {
        const registerPopup = document.getElementById('registerPopup');
        const signUpBtn = document.getElementById('SignUpBtn');
        const certificationPopup = document.getElementById('certificationPopup');

        if (event.target === registerPopup) {
            hidePopup('registerPopup');
            document.getElementById("overlay").style.display = "none";
        }

        if (event.target === signUpBtn) {
            showSignUpPopup();
        }

        if (event.target === certificationPopup) {
            hidePopup('certificationPopup');
            document.getElementById("overlay").style.display = "none";
        }
        
        // Close the dropdown if the user clicks outside of it
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
        function expandNotifications() {
            document.getElementById('notificationPopup').classList.add('expanded');
            var hiddenItems = document.querySelectorAll('.notification-item.hidden');
            hiddenItems.forEach(function(item) {
                item.classList.remove('hidden');
            });
            document.querySelector('.view-more').style.display = 'none';
        }

    </script>
    
</body>
</html>
