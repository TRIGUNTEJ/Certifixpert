<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <title>Certification Website</title>
    <link rel="stylesheet" href="/static/styles/admin-profile.css">
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
    <div class="background-bar"></div>
    <div id="registerPopup" class="regpopup" onmousedown="dragElement(this)">
    <span class="close-button" onclick="hidePopup('registerPopup')">&times;</span>
        <div class="admin-register-form">
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

    <div class="profile-container">
    <div class="edit-icon" onclick="toggleEdit()">
        <i class="far fa-edit"></i>
    </div>
    <div class="profile-details">
        <div class="profile-contents">
            <h2 class="name">Name:</h2>
            <p id="name" th:text="${admin.name}" contenteditable="true"></p>
        </div>
        <div class="profile-contents">
            <h2>Email:</h2>
            <p id="email" th:text="${admin.email}"></p>
        </div>
        <div class="profile-contents">
            <h2 class="contactNumber">Contact Number:</h2>
            <p id="contactNumber" th:text="${admin.contactNumber}" contenteditable="true"></p>
        </div>
        <div class="profile-contents">
            <h2 class="workExperience" >Work Experience:</h2>
            <p id="workExperience" th:text="${admin.workExperience}" contenteditable="true"></p>
        </div>
        <div class="profile-contents">
            <h2 class="numberOfCertifications">Certification Count:</h2>
            <p id="numberOfCertifications" th:text="${admin.numberOfCertifications}" contenteditable="true"></p>
        </div>
    </div>
    <div class="update-button" style="display: none;">
        <form id="updateForm" action="/admin/updateProfile" method="POST">
            <input type="hidden" id="updateName" name="name">
            <input type="hidden" id="updateContactNumber" name="contactNumber">
            <input type="hidden" id="updateWorkExperience" name="workExperience">
            <input type="hidden" id="updateNumberOfCertifications" name="numberOfCertifications">
            <button type="button"  onclick="updateProfile()">Update</button>
        </form>
    </div>
</div>



    <div class="profile-content">
        <div class="add-certification">
            <a onclick="showAdminCertPopup()">
                <i class="fas fa-plus"></i> Certifications
            </a>
        </div>
        <div class="profile-header">
            <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 20px;">Badges:</p>
            <div class="more-link" onclick="showCertificationPopup()">View More</div>
        </div>
        <div class="certifications-cards-content">
            <div class="certification-card" th:each="certification : ${certifications}">
                    <div class="cert-card">
                        <div class="certification-badge">
                            <img th:if="${certification.certificationName.toLowerCase()} == 'cloud practioner'" th:src="@{/static/images/AWS/aws_cp.png}" alt="CP Badge"/>
                            <img th:if="${certification.certificationName.toLowerCase()} == 'developer associate'" th:src="@{/static/images/AWS/aws_dev.png}" alt="DA Badge"/>
                            <img th:if="${certification.certificationName.toLowerCase()} == 'azure fundamentals'" th:src="@{/static/images/Microsoft/Azure_Fund.png}" alt="AZF Badge"/>
                            <img th:if="${certification.certificationName.toLowerCase()} == 'azure developer'" th:src="@{/static/images/Microsoft/Azure_Dev.png}" alt="AZDev Badge"/>
                            <img th:if="${certification.certificationName.toLowerCase()} == 'enterprise developer'" th:src="@{/static/images/RedHat/Red_Ex183.png}" alt="READ Badge"/>
                            <img th:if="${certification.certificationName.toLowerCase()} == 'google cloud'" th:src="@{/static/images/Google/gcb_badge.png}" alt="GCB Badge"/>
                            <img th:if="${certification.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                        </div>
                    </div>
                </a>
            </div>
        </div>  
        

        <div id="certifications-popup" class="certifications-popup">
            <div class="popup-content">
               <span class="cert-close-button" onclick="hidePopup('certifications-popup')">&times;</span>
                <div class="certification-card" th:each="certification : ${certifications}">
                        <div class="cert-card">
                            <div class="certification-badge">
                                <img th:if="${certification.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                                <img th:if="${certification.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                                <img th:if="${certification.certificationName.toLowerCase()} == 'azure developer'" th:src="@{/static/images/Microsoft/Azure_Dev.png}" alt="AZDev Badge"/>
                                <img th:if="${certification.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                                <img th:if="${certification.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                                <img th:if="${certification.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                                <img th:if="${certification.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                            </div>
                        </div>
                </div>
            </div>
        </div> 
               
    </div>
    
    <div id="admin-cert" class="admincert" onmousedown="dragElement(this)">
        <span class="close-button" onclick="hidePopup('admin-cert')">&times;</span>
        <div class="admincert-form">
            <h2 style="font-size: 1.3em; text-align: center;" onmousedown="startDrag(event)"></h2>
            <form action="/admin/add-admin-cert" method="post">
                <label for="organizationName">Organization Name:</label>
                <input type="text" id="organizationName" name="organizationName" required>
                <label for="certificationName">Certification Name:</label>
                <input type="text" id="certificationName" name="certificationName" required>
                <label for="certificationCode">Certification Code:</label>
                <input type="text" id="certificationCode" name="certificationCode" required>
                <label for="marksScored">Marks Scored:</label>
                <input type="text" id="marksScored" name="marksScored" required>
                <label for="totalmarks">Total Marks:</label>
                <input type="text" id="totalmarks" name="totalmarks" required>
                <label for="yearOfCertified">Year of Certified:</label>
                <input type="text" id="yearOfCertified" name="yearOfCertified" required>
                <label for="certificateId">Certificate ID:</label>
                <input type="text" id="certificateId" name="certificateId" required>
                <button type="submit" id="admincert-button" class="admincert-button">Add Certification</button>
            </form>
        </div>
    </div>

    <div id="overlay"></div>

    <script>
        function displayError(errorMessage) {
            var errorBar = document.getElementById('errorBar');
            errorBar.innerHTML = errorMessage;
            errorBar.style.display = 'block';
            setTimeout(function () {
                errorBar.style.display = 'none';
            }, 3000); // Hide after 3 seconds
        }

        function toggleDropdown() {
            var dropdownContent = document.getElementById("dropdownContent");
            dropdownContent.parentElement.classList.toggle("show");
        }

        window.onclick = function (event) {
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

        function showAdminCertPopup() {
            document.getElementById("admin-cert").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }

        function hidePopup(popupId) {
            document.getElementById(popupId).style.display = 'none';
            document.getElementById("overlay").style.display = 'none';
        }

        let offsetX, offsetY, isDragging = false;

        function startDrag(e) {
            e.preventDefault();
            offsetX = e.clientX;
            offsetY = e.clientY;
            isDragging = true;
        }

        function dragElement(elmnt) {
            document.onmouseup = function () {
                isDragging = false;
            };

            document.onmousemove = function (e) {
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

        function toggleEdit() {
            var profileContents = document.querySelectorAll('.profile-contents p[contenteditable="true"]');
            profileContents.forEach(function (element) {
                element.setAttribute('contenteditable', 'true');
            });

            var updateButton = document.querySelector('.update-button');
            updateButton.style.display = 'block';
        }

        function updateProfile() {
            var name = document.getElementById('name').innerText.trim();
            var contactNumber = document.getElementById('contactNumber').innerText.trim();
            var workExperience = document.getElementById('workExperience').innerText.trim();
            var numberOfCertifications = document.getElementById('numberOfCertifications').innerText.trim();

            // Check if the fields are empty, if so, set them to null
            name = name === "" ? null : name;
            contactNumber = contactNumber === "" ? null : contactNumber;
            workExperience = workExperience === "" ? null : workExperience;
            numberOfCertifications = numberOfCertifications === "" ? null : parseInt(numberOfCertifications);

            // Update the hidden inputs with the values
            document.getElementById('updateName').value = name;
            document.getElementById('updateContactNumber').value = contactNumber;
            document.getElementById('updateWorkExperience').value = workExperience;
            document.getElementById('updateNumberOfCertifications').value = numberOfCertifications;

            // Submit the form
            document.getElementById("updateForm").submit();
        }
        function showCertificationPopup() {
            document.getElementById("certifications-popup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        } 
        
    </script>
</body>

</html>
