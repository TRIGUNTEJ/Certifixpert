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
    <div class="background-bar">
        <div class="left-container">
            <a href="javascript:history.back()" class="back-button">
                <i class="fas fa-arrow-left"></i>
                Back
            </a>
        </div>
        <div class="right-container">
            <form th:action="@{/client/subscribe}" method="post" id="subscribeForm">
                <!-- Existing input fields -->
                <input type="hidden" name="clientName" th:value="${client.name}">
                <input type="hidden" name="clientEmail" th:value="${client.email}">
                <input type="hidden" name="clientContact" th:value="${client.contactNumber}">
                <input type="hidden" name="certificationName" th:value="${certification.certificationName}">
                <input type="hidden" name="organizationName" th:value="${certification.organizationName}">
                <input type="hidden" id="amount" th:value="${certification.subcribeCost}">
                <div th:each="certWithAdmin : ${certifications}">
                    <input type="hidden" name="adminEmails" th:value="${certWithAdmin.admin.email}">
                </div>
                <div>
                    <button type="button" class="subscribe-button" th:if="${!isSubscribed}" onclick="initiateRazorpayPayment()">
                        <i class="fas fa-credit-card"></i> Subscribe & Save
                    </button>
        
                    <div th:if="${isSubscribed}">
                        <button type="button" class="subscribe-button" th:if="${!isVerified}" disabled>
                            <i class="fas fa-credit-card"></i> Your subscription is yet to be confirmed
                        </button>
                        <button type="button" class="subscribe-button" th:if="${isVerified}" disabled>
                            <i class="fas fa-credit-card"></i> Subscription has been confirmed
                        </button>
                    </div>
                </div>
            </form>
        </div>
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
                <img th:if="${certification.certificationName.toLowerCase() == 'enterprise developer'}" src="/static/images/RedHat/Red_Ex183.png" alt="AWS Logo">
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
        <p class="certified-trainers-title">Certified Trainers:</p>
        <!-- Certified Trainers Section -->
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
    <input type="hidden" id="clientName" th:value="${client.name}">
    <input type="hidden" id="clientEmail" th:value="${client.email}">
    <input type="hidden" id="clientContact" th:value="${client.contactNumber}">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
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
        function initiateRazorpayPayment() {
            var amount = document.getElementById("amount").value * 100; 
            var clientName = document.getElementById('clientName').value;
            var clientEmail = document.getElementById('clientEmail').value;
            var clientContact = document.getElementById('clientContact').value;
            var options = {
                "key": "rzp_test_GJOqgN4xQ7IBBj", 
                "amount": amount, 
                "currency": "INR",
                "name": "CertifyXpert",
                "description": "Subscription for Certification",
                "handler": function(response) {
                    submitSubscriptionForm(response.razorpay_payment_id);
                },
                "prefill": {
                    "name": clientName,
                    "email": clientEmail,
                    "contact": clientContact
                },
                "notes": {
                    "certificationName": "${certification.certificationName}"
                },
                "theme": {
                    "color": "#3399cc"
                }
            };

            var rzp = new Razorpay(options);
            rzp.open();
        }

        function submitSubscriptionForm(paymentId) {
            var form = document.getElementById('subscribeForm');
            var paymentInput = document.createElement('input');
            paymentInput.setAttribute('type', 'hidden');
            paymentInput.setAttribute('name', 'razorpayPaymentId');
            paymentInput.setAttribute('value', paymentId);
            form.appendChild(paymentInput);
            form.submit();
        }
    </script>
</body>
</html>
