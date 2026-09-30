<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Messenger | Sign In</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            min-height: 100vh;

            font-family:
                Inter,
                Arial,
                Helvetica,
                sans-serif;

            background:
                radial-gradient(
                    circle at 20% 20%,
                    rgba(95, 82, 255, .16),
                    transparent 30%
                ),
                radial-gradient(
                    circle at 85% 80%,
                    rgba(0, 180, 255, .10),
                    transparent 30%
                ),
                #080b10;

            color: #fff;

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 24px;
        }

        .page {
            width: min(1100px, 100%);

            min-height: 650px;

            display: grid;

            grid-template-columns:
                1.08fr .92fr;

            overflow: hidden;

            border:
                1px solid
                rgba(255,255,255,.08);

            border-radius: 26px;

            background: #0f141b;

            box-shadow:
                0 30px 100px
                rgba(0,0,0,.55);
        }

        .hero {
            padding: 56px;

            display: flex;
            flex-direction: column;
            justify-content: space-between;

            background:
                linear-gradient(
                    145deg,
                    rgba(98,88,245,.10),
                    transparent 55%
                );
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-icon {
            width: 44px;
            height: 44px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 13px;

            background:
                linear-gradient(
                    135deg,
                    #625af0,
                    #8d60f6
                );

            font-size: 20px;
        }

        .brand-name {
            font-size: 19px;
            font-weight: 700;
        }

        .brand-caption {
            margin-top: 3px;
            color: #697585;
            font-size: 11px;
        }

        .hero-content {
            max-width: 500px;
        }

        .hero-content h1 {
            font-size: clamp(40px, 5vw, 58px);

            line-height: 1.05;

            letter-spacing: -2px;

            margin-bottom: 20px;
        }

        .hero-content h1 span {
            color: #8178ff;
        }

        .hero-content p {
            color: #84909f;

            line-height: 1.8;

            font-size: 15px;

            max-width: 460px;
        }

        .chips {
            display: flex;
            gap: 9px;
            flex-wrap: wrap;
            margin-top: 26px;
        }

        .chip {
            padding: 9px 12px;

            border:
                1px solid
                rgba(255,255,255,.07);

            border-radius: 10px;

            color: #aeb8c4;

            background:
                rgba(255,255,255,.035);

            font-size: 11px;
        }

        .footer {
            color: #4f5966;
            font-size: 11px;
        }

        .login-area {
            display: flex;

            align-items: center;
            justify-content: center;

            padding: 45px;

            background: #0b1016;
        }

        .login-box {
            width: 100%;
            max-width: 370px;
        }

        .login-box h2 {
            font-size: 29px;

            margin-bottom: 7px;
        }

        .login-box .sub {
            color: #727e8c;

            font-size: 13px;

            line-height: 1.6;

            margin-bottom: 30px;
        }

        .error {
            margin-bottom: 16px;

            padding: 12px 13px;

            border-radius: 10px;

            background:
                rgba(255,70,70,.08);

            border:
                1px solid
                rgba(255,70,70,.15);

            color: #ff8f8f;

            font-size: 12px;
        }

        .field {
            margin-bottom: 18px;
        }

        .field label {
            display: block;

            margin-bottom: 8px;

            color: #bbc4cf;

            font-size: 12px;

            font-weight: 600;
        }

        .field input {
            width: 100%;

            height: 48px;

            border:
                1px solid
                rgba(255,255,255,.08);

            border-radius: 11px;

            background: #131922;

            color: white;

            outline: none;

            padding: 0 14px;

            font-size: 13px;

            transition: .2s;
        }

        .field input::placeholder {
            color: #596573;
        }

        .field input:focus {
            border-color: #7066f5;

            box-shadow:
                0 0 0 4px
                rgba(112,102,245,.10);
        }

        .submit {
            width: 100%;

            height: 48px;

            border: none;

            border-radius: 11px;

            color: white;

            font-size: 13px;

            font-weight: 700;

            cursor: pointer;

            background:
                linear-gradient(
                    135deg,
                    #6159ed,
                    #8f61f8
                );

            transition: .2s;
        }

        .submit:hover {
            transform: translateY(-1px);
        }

        .submit:active {
            transform: translateY(0);
        }

        .security {
            margin-top: 18px;

            text-align: center;

            color: #4e5967;

            font-size: 10px;
        }

        @media (max-width: 850px) {

            .page {
                grid-template-columns: 1fr;
                min-height: auto;
            }

            .hero {
                display: none;
            }

            .login-area {
                min-height: 100vh;
            }
        }

    </style>

</head>

<body>

<div class="page">

    <section class="hero">

        <div class="brand">

            <div class="brand-icon">
                💬
            </div>

            <div>

                <div class="brand-name">
                    Messenger
                </div>

                <div class="brand-caption">
                    Private conversations
                </div>

            </div>

        </div>


        <div class="hero-content">

            <h1>
                Talk to the
                <br>
                people who
                <span>matter.</span>
            </h1>

            <p>
                Sign in to your account and continue
                your conversations from anywhere.
            </p>


            <div class="chips">

                <div class="chip">
                    Private messaging
                </div>

                <div class="chip">
                    Live message updates
                </div>

                <div class="chip">
                    Simple interface
                </div>

            </div>

        </div>


        <div class="footer">
            Messenger
        </div>

    </section>


    <section class="login-area">

        <div class="login-box">

            <h2>
                Welcome back
            </h2>

            <p class="sub">
                Sign in to continue to your conversations.
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

                    <label for="username">
                        Username
                    </label>

                    <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter username"
                        autocomplete="username"
                        required>

                </div>


                <div class="field">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter password"
                        autocomplete="current-password"
                        required>

                </div>


                <button
                    class="submit"
                    type="submit">

                    Sign in

                </button>

            </form>


            <div class="security">
                Use your registered account credentials.
            </div>

        </div>

    </section>

</div>

</body>

</html>