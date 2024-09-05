<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Certification Website</title>
    <link rel="stylesheet" href="/static/styles/home.css">
    <script src="https://kit.fontawesome.com/1760d77ffa.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Encode+Sans+Condensed:wght@400;700&display=swap">
</head>

<body>
    <nav>
        <div class="Company-logo">
            <img src="/static/images/others/logo.png" alt="Company Logo">
        </div>
        <div class="nav-links Home">
            <a href="#">Home</a>
        </div>
        <div class="search-bar">
            <input type="text" class="search-bar-input" placeholder="What do you want to learn......">
            <button class = "search-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
        <div class="nav-links Catalog">
            <a onclick="toggleLoginPopup()">Certification Catalog</a>
        </div>
        <div class="Sign-button" id="signInBtn">
            <button onclick="toggleLoginPopup()">Sign In</button>
        </div>
    </nav>
    <div id="loginPopup" class="popup" onmousedown="dragElement(this)">
        <div class="login-form">
            <span class="close-button" onclick="hidePopup('loginPopup')">&times;</span>
            <h2 style="font-size: 1.3em; text-align: center;" onmousedown="startDrag(event)">Let's start learning</h2>
            <form action="/login" method="post">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <p th:if="${error}" style="color: red" th:text="${error}"></p>
             <div class = "forgot-text">
                <a href="javascript:void(0);" onclick="showForgotPasswordPopup()">Forgot Password?</a>
            </div>
            <div class = "Signup-text">
                <a href="javascript:void(0);" id ="SignUpBtn" onclick="showSignUpPopup()">Create an Account</a>
            </div>
                <button type="submit" class="login-button">Login</button>
                <p>--------------------------or---------------------------</p>
            
                <div class="social-buttons">
				    <button onclick="loginWithGoogle()">
				        <div class="gg-logo">
				            <img src="/static/images/others/gg-icon.png" alt="Google Logo">
				        </div>
				        Sign in with Google
				    </button>
				</div>

            </form>
        </div>
    </div>

    <div id="ForgotPasswordPopup" class="forgetpopup" onmousedown="dragElement(this)">
        <div class="forget-form">
            <span class="close-button" onclick="hidePopup('ForgotPasswordPopup')">&times;</span>
            <h2 style="font-size: 1.3em; text-align: center;" onmousedown="startDrag(event)">Enter Email</h2>
            <form action="/forgotpassword" method="post">
                <label for="email">Enter the email to reset the password:</label>
                <input type="text" id="email" name="email" required>
                <button type="submit" id="forget-button" class="forget-button">Enter</button>
            </form>
        </div>
    </div>

    <div id="registerPopup" class="regpopup" onmousedown="dragElement(this)">
        <div class="register-form">
            <span class="close-button" onclick="hidePopup('registerPopup')">&times;</span>
            <h2 style="font-size: 1.3em; text-align: center;" onmousedown="startDrag(event)">Sign Up</h2>
            <form action="/register" method="post">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <label for="confirmpassword">Confirm Password:</label>
                <input type="password" id="confirmpassword" name="confirmpassword" required>
                <button type="submit" id="register-button" class="register-button">Sign Up</button>
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
    <div class="contact-button" id="contactButton">
        <i class="fas fa-comment"></i>
    </div>
    <div class="contact-menu" id="contactMenu">
        <div class="contact-item" onclick="composeMail()"><i class="fas fa-envelope"></i></div>
        <div class="contact-item" onclick="openWhatsApp()"><i class="fas fa-phone"></i></div>
        <div class="contact-item" onclick="openTelegram()"><i class="fab fa-telegram"></i></div>
        <div class="contact-item" onclick="openGoogleMaps()"><i class="fas fa-map-marker-alt"></i></div>
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
    
        function toggleLoginPopup() {
            document.getElementById("loginPopup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }
        function showSignUpPopup() {
        	hidePopup('loginPopup');
            document.getElementById("registerPopup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }
        function showForgotPasswordPopup() {
        	hidePopup('loginPopup');
            document.getElementById("ForgotPasswordPopup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }
        window.onclick = function (event) {
            const loginPopup = document.getElementById('loginPopup');
            const registerPopup = document.getElementById('registerPopup');
            const signInBtn = document.getElementById('signInBtn');
            const signUpBtn = document.getElementById('SignUpBtn');

            if (event.target === loginPopup) {
                hidePopup('loginPopup');
                document.getElementById("overlay").style.display = "none";
            }

            if (event.target === signInBtn) {
                toggleLoginPopup();
            }

            if (event.target === registerPopup) {
                hidePopup('registerPopup');
                document.getElementById("overlay").style.display = "none";
            }

            if (event.target === signUpBtn) {
                showSignUpPopup();
            }
        };
        function hidePopup(popupId) {
        document.getElementById(popupId).style.display = 'none';
        document.getElementById("overlay").style.display = 'none';
        }
    
        function loginWithGoogle() {
            window.location.href = '/google-signin';
        }
        function displayError(errorMessage) {
            var errorBar = document.getElementById('errorBar');
            errorBar.innerHTML = errorMessage;
            errorBar.style.display = 'block';
            setTimeout(function() {
                errorBar.style.display = 'none';
            }, 3000); 
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
    </script>
    
</body>
</html>
