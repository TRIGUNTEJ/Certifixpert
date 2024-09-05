<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <title>Certification Website</title>
    <link rel="stylesheet" href="/static/styles/profile.css">
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
            <input type="text" class="search-bar-input" placeholder="What do you want to learn......">
            <button class = "search-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
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

    <div class="background-bar"></div>
    <div class="profile-container">
        <div class="edit-icon" onclick="toggleEdit()">
            <i class="far fa-edit"></i>
        </div>
        <div class="profile-details">
            <div class="profile-contents">
                <h2 class="name">Name:</h2>
                <p id="name" th:text="${client.name}" contenteditable="true"></p>
            </div>
            <div class="profile-contents">
                <h2>Email:</h2>
                <p id="email" th:text="${client.email}"></p>
            </div>
            <div class="profile-contents">
                <h2 class="contactNumber">Contact Number:</h2>
                <p id="contactNumber" th:text="${client.contactNumber}" contenteditable="true"></p>
            </div>
        </div>
        <div class="update-button" style="display: none;">
            <form id="updateForm" action="/client/updateProfile" method="POST">
                <input type="hidden" id="updateName" name="name">
                <input type="hidden" id="updateContactNumber" name="contactNumber">
                <button type="button"  onclick="updateProfile()">Update</button>
            </form>
        </div>
    </div>
    <div class="profile-content">
        <div class = profile-header>
            <p style="font-size: 1.7em; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;margin-left: 20px;">Subcriptions:</p>
            <div class="more-link" onclick="showCertificationPopup()">View More</div>
        </div>
        
        <div class="profile-certification-container">
            <div class="profile-card-display" th:each="cert : ${certifications}">
                <div class="profile-cert-info-logo">
                    <div class="profile-cert-org-logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                        <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                    </div> 
                    <div class="profile-cert-badg-logo">
                        <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                        <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                    </div>
                </div>
                <div class="profile-cert-info">
                    <h3>Certification Name:</h3>
                    <p th:text="${cert.certificationName}"></p>
                </div>
                <div class="profile-cert-info">
                    <h3>Trainer Mail:</h3>
                    <p th:text="${cert.adminEmails}"></p>
                </div>
                <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="profile-view-course-button">View Details</a>
                <div class="profile-view-counter" th:data-cert-name="${cert.certificationName}">
                </div>
            </div>
        </div>
        
    

        <div id="profile-certification-popup" class="profile-popup">
            <span class="profile-close-button" onclick="hidePopup('profile-certification-popup')">&times;</span>
            <div class="profile-popup-certification-container">
                <div class="profile-popup-card-display" th:each="cert : ${certifications}">
                    <div class="profile-cert-info-logo">
                        <div class="profile-cert-org-logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'aws'}" src="/static/images/AWS/aws_logo.png" alt="AWS Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'redhat'}" src="/static/images/RedHat/redhat_logo.png" alt="RedHat Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'microsoft'}" src="/static/images/Microsoft/microsoft_logo.png" alt="Microsoft Logo">
                            <img th:if="${cert.organizationName.toLowerCase() == 'google'}" src="/static/images/Google/gg_icon.png" alt="Google Logo">
                        </div> 
                        <div class="profile-cert-badg-logo">
                            <img th:if="${cert.certificationName.toLowerCase() == 'cloud practioner'}" src="/static/images/AWS/aws_cp.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'azure fundamentals'}" src="/static/images/Microsoft/Azure_Fund.png" alt="Azure Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'google cloud'}" src="/static/images/Google/gcb_badge.png" alt="Google Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'developer associate'}" src="/static/images/AWS/aws_dev.png" alt="AWS Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="Google Badge">
                            <img th:if="${cert.certificationName.toLowerCase() == 'devops engineer'}" src="/static/images/AWS/aws_deveng.png" alt="AWS Logo">
                        </div>
                    </div>
                    <div class="profile-cert-info">
                        <h3>Certification Name:</h3>
                        <p th:text="${cert.certificationName}"></p>
                    </div>
                    <div class="profile-cert-info">
                        <h3>Trainer Mail:</h3>
                        <p th:text="${cert.adminEmails}"></p>
                    </div>
                    <a th:href="@{'/client/view/certification/' + ${cert.certificationName}}" class="profile-view-course-button">View Details</a>
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
            setTimeout(function () {
                errorBar.style.display = 'none';
            }, 3000); 
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
            // Check if the fields are empty, if so, set them to null
            name = name === "" ? null : name;
            contactNumber = contactNumber === "" ? null : contactNumber;

            // Update the hidden inputs with the values
            document.getElementById('updateName').value = name;
            document.getElementById('updateContactNumber').value = contactNumber;

            // Submit the form
            document.getElementById("updateForm").submit();
        }
        function showCertificationPopup() {
            document.getElementById("profile-certification-popup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        } 
        function hidePopup(popupId) {
            document.getElementById(popupId).style.display = 'none';
            document.getElementById("overlay").style.display = 'none';
        }
    </script>
</body>

</html>
