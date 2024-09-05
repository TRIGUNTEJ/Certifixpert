<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Certification Website</title>
    <link rel="stylesheet" href="/static/styles/admin-catalog.css">
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
        <span class="close-button" onclick="hidePopup('certificationPopup')">&times;</span>
        <div class="certification-form">
            <h2 style="font-size: 1.3em; text-align: center;" onmousedown="startDrag(event)">Certification Details</h2>
            <form action="/add/certification" method="post"  enctype="multipart/form-data">
                <label for="organizationName">Organization Name:</label>
                <input type="text" id="organizationName" name="organizationName" required>

                <label for="certificationName">Certification Name:</label>
                <input type="text" id="certificationName" name="certificationName" required>

                <label for="certificationCode">Certification Code:</label>
                <input type="text" id="certificationCode" name="certificationCode" required>

                <label for="certificationLevel">Certification Level:</label>
                <input type="text" id="certificationLevel" name="certificationLevel" required>

                <label for="examFormat">Exam Format:</label>
                <input type="text" id="examFormat" name="examFormat" required>

                <label for="duration">Duration:</label>
                <input type="text" id="duration" name="duration" required>

                <label for="passingScore">Passing Score:</label>
                <input type="text" id="passingScore" name="passingScore" required>

                <label for="validityPeriod">Validity Period:</label>
                <input type="text" id="validityPeriod" name="validityPeriod" required>
                
                <label for="Cost">Cost</label>
                <input type="text" id="Cost" name="Cost" required>

                <label for="voucherAvailabilty">Availability of Voucher:</label>
                <input type="text" id="voucherAvailabilty" name="voucherAvailabilty" required>

                <label for="description1">Description1:</label>
                <textarea id="description1" name="description1" rows="4" required></textarea>
                
                <label for="description2">Description2:</label>
                <textarea id="description2" name="description2" rows="4" required></textarea>
                
                <label for="description3">Description3:</label>
                <textarea id="description3" name="description3" rows="4" required></textarea>

                <label for="subcribeCost">Subcription Cost:</label>
                <input type="text" id="subcribeCost" name="subcribeCost" required>

                <button type="submit" id="addCertificationButton" class="add-certification-button">Add Certification</button>
            </form>
        </div>
    </div>
    <div class="background-bar"></div>
    <div class="content">
        <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Certifications:</p>
        <div class="certification-container">
            <div class="card" onclick="showCertificationPopup()">
                <div class="plus-symbol">
                    <i class="fas fa-plus"></i>
                </div>
            </div>
            <div th:each="cert : ${certifications}" class="card-display">
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
                        <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="AWS Logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="AWS Logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="AWS Logo">
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
                <a th:href="@{'/admin/view/certification/' + ${cert.certificationName}}" class ="view-course-button">View Details</a>
				<a th:href="@{'/delete/certification/' + ${cert.certificationName}}" class="delete-button" onclick="handleDeleteButtonClick(this)">
				    <i class="fas fa-trash"></i>
				</a>
           
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
        function handleDeleteButtonClick(button) {
            // Add the 'clicked' class to the button and its parent card-display
            button.classList.add('clicked');
            button.parentElement.classList.add('clicked');
        }

    </script>
    
    
</body>
</html>
