<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Firebase Authentication</title>
    <script type="module">
        import { initializeApp } from 'https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js';
        import { getAnalytics } from 'https://www.gstatic.com/firebasejs/10.8.0/firebase-analytics.js';
        import { getAuth, signInWithPopup, GoogleAuthProvider } from 'https://www.gstatic.com/firebasejs/10.8.0/firebase-auth.js';

        const firebaseConfig = {
            apiKey: "AIzaSyCvI9xMs0TBdIeAM4azHWmp-1Oh0Qc-ikk",
            authDomain: "certifyxpert.firebaseapp.com",
            projectId: "certifyxpert",
            storageBucket: "certifyxpert.appspot.com",
            messagingSenderId: "841954348126",
            appId: "1:841954348126:web:29b2cda98efb69684338cf",
            measurementId: "G-TNS0SQ86PY"
        };

        const app = initializeApp(firebaseConfig);
        const analytics = getAnalytics(app);
        const auth = getAuth();

        function loginWithGoogle() {
            const provider = new GoogleAuthProvider();
            signInWithPopup(auth, provider)
                .then((result) => {
                    const user = result.user;
                    const email = user.email;

                    // Send the email to the backend
                    fetch('/google-signin', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ email: email })
                    })
                    .then(response => response.text())
                    .then(responseUrl => {
                        if (responseUrl) {
                            window.location.href = responseUrl;
                        } else {
                            console.error('Failed to sign in with Google');
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
                })
                .catch((error) => {
                    console.error('Google sign-in error:', error);
                });
        }

        window.onload = function() {
            loginWithGoogle();
        };
    </script>
    <style>
        body {
            height: 100%;
            margin: 0;
            background: url('/static/images/others/loading_bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .back-container img[alt="backend"]{
            margin-left: 40%;
            margin-top: 15%;
            width: 20%;
            height: 20%;
        }
    </style>
</head>
<body>
</body>
</html>
