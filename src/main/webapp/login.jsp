<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Connect - Login</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {

            min-height: 100vh;

            font-family:
                "Segoe UI",
                Arial,
                sans-serif;

            background: #eef3f8;

            color: #172033;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 20px;
        }


        .login-wrapper {

            width: 100%;

            max-width: 1050px;

            min-height: 620px;

            display: grid;

            grid-template-columns:
                1.15fr .85fr;

            background: #ffffff;

            border-radius: 24px;

            overflow: hidden;

            box-shadow:
                0 25px 70px
                rgba(30, 50, 80, .15);
        }


        /* LEFT */

        .brand-section {

            padding: 55px;

            display: flex;

            flex-direction: column;

            justify-content: space-between;

            background:
                linear-gradient(
                    145deg,
                    #2563eb,
                    #1d4ed8
                );

            color: white;

            position: relative;

            overflow: hidden;
        }


        .brand-section::before {

            content: "";

            position: absolute;

            width: 330px;

            height: 330px;

            border-radius: 50%;

            background:
                rgba(255,255,255,.07);

            right: -130px;

            top: -100px;
        }


        .brand-section::after {

            content: "";

            position: absolute;

            width: 280px;

            height: 280px;

            border-radius: 50%;

            background:
                rgba(255,255,255,.05);

            left: -130px;

            bottom: -100px;
        }


        .logo {

            position: relative;

            z-index: 2;

            display: flex;

            align-items: center;

            gap: 12px;
        }


        .logo-icon {

            width: 46px;

            height: 46px;

            border-radius: 14px;

            background:
                rgba(255,255,255,.18);

            display: flex;

            justify-content: center;

            align-items: center;

            font-size: 22px;
        }


        .logo-name {

            font-size: 20px;

            font-weight: 700;
        }


        .brand-content {

            position: relative;

            z-index: 2;

            max-width: 500px;
        }


        .brand-content h1 {

            font-size: 50px;

            line-height: 1.05;

            letter-spacing: -1.5px;

            margin-bottom: 22px;
        }


        .brand-content p {

            color:
                rgba(255,255,255,.78);

            line-height: 1.8;

            font-size: 15px;

            max-width: 450px;
        }


        .feature-grid {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 12px;

            margin-top: 30px;

            max-width: 450px;
        }


        .feature {

            padding: 14px;

            border:
                1px solid
                rgba(255,255,255,.12);

            background:
                rgba(255,255,255,.07);

            border-radius: 12px;
        }


        .feature-title {

            font-size: 12px;

            font-weight: 700;

            margin-bottom: 5px;
        }


        .feature-text {

            font-size: 10px;

            color:
                rgba(255,255,255,.65);

            line-height: 1.5;
        }


        .copyright {

            position: relative;

            z-index: 2;

            color:
                rgba(255,255,255,.55);

            font-size: 11px;
        }


        /* RIGHT */

        .form-section {

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 45px;
        }


        .form-box {

            width: 100%;

            max-width: 340px;
        }


        .form-box h2 {

            color: #172033;

            font-size: 28px;

            margin-bottom: 8px;
        }


        .subtitle {

            color: #7a8595;

            font-size: 13px;

            line-height: 1.6;

            margin-bottom: 28px;
        }


        .error {

            background: #fff1f2;

            border:
                1px solid
                #fecdd3;

            color: #dc2626;

            border-radius: 9px;

            padding: 11px 13px;

            margin-bottom: 17px;

            font-size: 12px;
        }


        .field {

            margin-bottom: 17px;
        }


        .field label {

            display: block;

            margin-bottom: 7px;

            color: #3c4657;

            font-size: 12px;

            font-weight: 600;
        }


        .field input {

            width: 100%;

            height: 48px;

            padding: 0 14px;

            border:
                1px solid
                #d7dee8;

            border-radius: 10px;

            background: #f9fbfd;

            outline: none;

            color: #172033;

            font-size: 13px;

            transition: .2s;
        }


        .field input::placeholder {
            color: #9ba5b3;
        }


        .field input:focus {

            background: #ffffff;

            border-color: #3b82f6;

            box-shadow:
                0 0 0 4px
                rgba(59,130,246,.10);
        }


        .login-button {

            width: 100%;

            height: 48px;

            margin-top: 5px;

            border: none;

            border-radius: 10px;

            background: #2563eb;

            color: white;

            font-size: 13px;

            font-weight: 700;

            cursor: pointer;

            transition: .2s;
        }


        .login-button:hover {

            background: #1d4ed8;

            transform:
                translateY(-1px);
        }


        .login-button:active {

            transform:
                translateY(0);
        }


        .login-note {

            margin-top: 18px;

            text-align: center;

            color: #98a2b1;

            font-size: 10px;
        }


        @media (max-width: 800px) {

            body {
                padding: 0;
            }

            .login-wrapper {

                max-width: none;

                min-height: 100vh;

                border-radius: 0;

                grid-template-columns: 1fr;
            }


            .brand-section {
                display: none;
            }


            .form-section {
                min-height: 100vh;

                padding: 30px;
            }
        }

    </style>

</head>


<body>


<div class="login-wrapper">


    <!-- BRAND SECTION -->

    <section class="brand-section">


        <div class="logo">

            <div class="logo-icon">
                💬
            </div>

            <div class="logo-name">
                Connect
            </div>

        </div>


        <div class="brand-content">

            <h1>

                Conversations
                <br>

                made simple.

            </h1>


            <p>

                Sign in to access your private
                conversations and stay connected
                with the people you communicate with.

            </p>


            <div class="feature-grid">


                <div class="feature">

                    <div class="feature-title">
                        Private
                    </div>

                    <div class="feature-text">
                        Direct conversations
                        between users.
                    </div>

                </div>


                <div class="feature">

                    <div class="feature-title">
                        Fast
                    </div>

                    <div class="feature-text">
                        Messages update
                        automatically.
                    </div>

                </div>


                <div class="feature">

                    <div class="feature-title">
                        Simple
                    </div>

                    <div class="feature-text">
                        Clean messaging
                        experience.
                    </div>

                </div>


                <div class="feature">

                    <div class="feature-title">
                        Connected
                    </div>

                    <div class="feature-text">
                        Communicate from
                        any device.
                    </div>

                </div>


            </div>

        </div>


        <div class="copyright">

            Connect Messaging Platform

        </div>


    </section>


    <!-- LOGIN -->

    <section class="form-section">


        <div class="form-box">


            <h2>
                Sign in
            </h2>


            <p class="subtitle">

                Use your registered account
                to continue.

            </p>


            <%
                String error =
                    request.getParameter("error");

                if (error != null) {
            %>

                <div class="error">

                    <%= error %>

                </div>

            <%
                }
            %>


            <form
                action="login"
                method="post">


                <div class="field">

                    <label
                        for="username">

                        Username

                    </label>


                    <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter your username"
                        autocomplete="username"
                        required>

                </div>


                <div class="field">

                    <label
                        for="password">

                        Password

                    </label>


                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        autocomplete="current-password"
                        required>

                </div>


                <button
                    type="submit"
                    class="login-button">

                    Sign in

                </button>


            </form>


            <div class="login-note">

                Enter your registered credentials.

            </div>


        </div>


    </section>


</div>


</body>

</html>