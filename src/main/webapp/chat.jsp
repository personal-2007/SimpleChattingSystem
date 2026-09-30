<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String username =
        (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Messenger</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            width: 100%;
            height: 100vh;
            overflow: hidden;

            font-family:
                Inter,
                Arial,
                Helvetica,
                sans-serif;

            background: #080c11;

            color: #fff;
        }

        .app {
            width: 100%;
            height: 100vh;

            display: flex;

            background: #0c1117;
        }

        /* LEFT SIDEBAR */

        .sidebar {

            width: 330px;

            flex-shrink: 0;

            display: flex;

            flex-direction: column;

            border-right:
                1px solid
                rgba(255,255,255,.07);

            background: #10161d;
        }

        .topbar {

            height: 70px;

            padding: 0 17px;

            display: flex;

            align-items: center;

            border-bottom:
                1px solid
                rgba(255,255,255,.06);
        }

        .brand {

            display: flex;

            align-items: center;

            gap: 10px;
        }

        .brand-icon {

            width: 38px;
            height: 38px;

            display: flex;

            justify-content: center;
            align-items: center;

            border-radius: 11px;

            background:
                linear-gradient(
                    135deg,
                    #645bf0,
                    #9061f7
                );
        }

        .brand-name {
            font-size: 15px;
            font-weight: 700;
        }

        .brand-status {
            margin-top: 3px;
            color: #596676;
            font-size: 9px;
        }

        .profile {

            padding: 17px;

            display: flex;

            align-items: center;

            gap: 11px;

            border-bottom:
                1px solid
                rgba(255,255,255,.05);
        }

        .avatar {

            width: 44px;
            height: 44px;

            display: flex;

            justify-content: center;
            align-items: center;

            border-radius: 50%;

            background:
                linear-gradient(
                    135deg,
                    #625af1,
                    #8a61f5
                );

            font-size: 15px;

            font-weight: 700;
        }

        .profile-text {
            min-width: 0;
        }

        .profile-name {
            font-size: 13px;
            font-weight: 700;

            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .active-status {

            display: flex;

            align-items: center;

            gap: 5px;

            margin-top: 4px;

            color: #49cd82;

            font-size: 10px;
        }

        .active-dot {

            width: 6px;
            height: 6px;

            border-radius: 50%;

            background: #49cd82;
        }

        .section-title {

            padding:
                17px
                17px
                10px;

            color: #596676;

            font-size: 10px;

            text-transform: uppercase;

            letter-spacing: .8px;

            font-weight: 700;
        }

        .search-box {

            padding:
                0
                14px
                15px;
        }

        .search {

            width: 100%;

            height: 42px;

            padding:
                0
                13px;

            outline: none;

            border:
                1px solid
                rgba(255,255,255,.07);

            border-radius: 10px;

            background: #151c24;

            color: white;

            font-size: 12px;
        }

        .search::placeholder {
            color: #596675;
        }

        .search:focus {
            border-color: #6e66ef;
        }

        .selected-contact {

            margin: 0 11px;

            padding: 11px;

            display: none;

            align-items: center;

            gap: 10px;

            border-radius: 11px;

            background:
                rgba(101,91,239,.11);
        }

        .contact-avatar {

            width: 42px;
            height: 42px;

            border-radius: 50%;

            display: flex;

            align-items: center;
            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    #374252,
                    #617086
                );

            font-weight: 700;

            flex-shrink: 0;
        }

        .contact-info {
            min-width: 0;
        }

        .contact-name {

            font-size: 13px;

            font-weight: 700;

            overflow: hidden;

            white-space: nowrap;

            text-overflow: ellipsis;
        }

        .contact-caption {

            margin-top: 4px;

            color: #687484;

            font-size: 9px;
        }

        /* MAIN */

        .main {

            flex: 1;

            min-width: 0;

            display: flex;

            flex-direction: column;
        }

        .chat-header {

            height: 70px;

            flex-shrink: 0;

            padding: 0 20px;

            display: flex;

            align-items: center;

            gap: 11px;

            border-bottom:
                1px solid
                rgba(255,255,255,.06);

            background: #10161d;
        }

        .chat-avatar {

            width: 42px;
            height: 42px;

            flex-shrink: 0;

            border-radius: 50%;

            display: flex;

            align-items: center;
            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    #384454,
                    #667990
                );

            font-size: 14px;

            font-weight: 700;
        }

        .chat-info {
            min-width: 0;
        }

        .chat-name {

            font-size: 13px;

            font-weight: 700;
        }

        .chat-description {

            margin-top: 3px;

            color: #5f6c7b;

            font-size: 9px;
        }

        .messages {

            flex: 1;

            overflow-y: auto;

            padding:
                25px
                26px;

            background:
                radial-gradient(
                    circle at 50% 15%,
                    rgba(102,91,239,.035),
                    transparent 48%
                );
        }

        .welcome {

            height: 100%;

            display: flex;

            align-items: center;

            justify-content: center;

            flex-direction: column;

            text-align: center;

            color: #5b6877;
        }

        .welcome-icon {

            width: 64px;
            height: 64px;

            margin-bottom: 14px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 18px;

            background:
                rgba(101,91,239,.08);

            font-size: 25px;
        }

        .welcome h3 {

            color: #aeb7c2;

            font-size: 15px;

            margin-bottom: 7px;
        }

        .welcome p {

            max-width: 290px;

            line-height: 1.65;

            font-size: 11px;
        }

        .message-row {

            display: flex;

            margin-bottom: 14px;
        }

        .message-row.mine {
            justify-content: flex-end;
        }

        .bubble {

            max-width: 68%;

            padding:
                10px 13px;

            border-radius: 14px;

            background: #18212b;

            border:
                1px solid
                rgba(255,255,255,.05);
        }

        .message-row:not(.mine)
        .bubble {

            border-bottom-left-radius: 4px;
        }

        .message-row.mine
        .bubble {

            border-bottom-right-radius: 4px;

            background:
                linear-gradient(
                    135deg,
                    #5b55dd,
                    #7959db
                );
        }

        .sender {

            margin-bottom: 5px;

            color: #8b98a7;

            font-size: 9px;

            font-weight: 700;
        }

        .message-row.mine
        .sender {

            color:
                rgba(255,255,255,.72);
        }

        .message-text {

            font-size: 13px;

            line-height: 1.55;

            white-space: pre-wrap;

            word-break: break-word;
        }

        .message-time {

            margin-top: 6px;

            text-align: right;

            color: #657281;

            font-size: 8px;
        }

        .message-row.mine
        .message-time {

            color:
                rgba(255,255,255,.62);
        }

        /* COMPOSER */

        .composer {

            padding:
                11px
                17px;

            border-top:
                1px solid
                rgba(255,255,255,.06);

            background: #10161d;
        }

        .composer-box {

            display: flex;

            align-items: center;

            gap: 8px;

            padding:
                5px
                6px
                5px
                13px;

            border:
                1px solid
                rgba(255,255,255,.07);

            border-radius: 13px;

            background: #151c24;
        }

        .message-input {

            flex: 1;

            min-width: 0;

            height: 38px;

            border: none;

            outline: none;

            background: transparent;

            color: #fff;

            font-size: 13px;
        }

        .message-input::placeholder {
            color: #5b6876;
        }

        .send {

            width: 39px;

            height: 39px;

            border: none;

            border-radius: 11px;

            background:
                linear-gradient(
                    135deg,
                    #6159ef,
                    #8b60f5
                );

            color: white;

            cursor: pointer;

            font-size: 15px;
        }

        .send:disabled {
            opacity: .45;
            cursor: default;
        }

        ::-webkit-scrollbar {
            width: 5px;
        }

        ::-webkit-scrollbar-track {
            background: transparent;
        }

        ::-webkit-scrollbar-thumb {
            background: #293440;
            border-radius: 10px;
        }

        @media (max-width: 700px) {

            .sidebar {
                display: none;
            }

            .messages {
                padding:
                    17px
                    13px;
            }

            .bubble {
                max-width: 88%;
            }
        }

    </style>

</head>

<body>

<div class="app">


    <!-- SIDEBAR -->

    <aside class="sidebar">

        <div class="topbar">

            <div class="brand">

                <div class="brand-icon">
                    💬
                </div>

                <div>

                    <div class="brand-name">
                        Messenger
                    </div>

                    <div class="brand-status">
                        Private messaging
                    </div>

                </div>

            </div>

        </div>


        <div class="profile">

            <div class="avatar">

                <%= username.substring(0, 1).toUpperCase() %>

            </div>

            <div class="profile-text">

                <div class="profile-name">
                    <%= username %>
                </div>

                <div class="active-status">

                    <span class="active-dot"></span>

                    Active now

                </div>

            </div>

        </div>


        <div class="section-title">
            Conversations
        </div>


        <div class="search-box">

            <input
                id="receiver"
                class="search"
                type="text"
                placeholder="Search username..."
                autocomplete="off">

        </div>


        <div
            id="selectedContact"
            class="selected-contact">

            <div
                id="contactAvatar"
                class="contact-avatar">

                U

            </div>

            <div class="contact-info">

                <div
                    id="contactName"
                    class="contact-name">

                    User

                </div>

                <div class="contact-caption">
                    Private conversation
                </div>

            </div>

        </div>

    </aside>


    <!-- MAIN CHAT -->

    <main class="main">


        <header class="chat-header">

            <div
                id="chatAvatar"
                class="chat-avatar">

                U

            </div>


            <div class="chat-info">

                <div
                    id="chatName"
                    class="chat-name">

                    Select a conversation

                </div>

                <div
                    id="chatDescription"
                    class="chat-description">

                    Search for a username to begin.

                </div>

            </div>

        </header>


        <section
            id="messages"
            class="messages">

            <div class="welcome">

                <div class="welcome-icon">
                    💬
                </div>

                <h3>
                    Your conversations
                </h3>

                <p>
                    Search for another registered user
                    and start a private conversation.
                </p>

            </div>

        </section>


        <div class="composer">

            <div class="composer-box">

                <input
                    id="message"
                    class="message-input"
                    type="text"
                    placeholder="Write a message..."
                    autocomplete="off">

                <button
                    id="send"
                    class="send"
                    type="button"
                    onclick="sendMessage()">

                    ➤

                </button>

            </div>

        </div>

    </main>

</div>


<script>

    const currentUser =
        '<%= username
        .replace("\\", "\\\\")
        .replace("'", "\\'")
        .replace("\"", "\\\"") %>';


    const receiver =
        document.getElementById("receiver");


    const message =
        document.getElementById("message");


    const messages =
        document.getElementById("messages");


    const send =
        document.getElementById("send");


    function setConversation(username) {

        const selected =
            document.getElementById(
                "selectedContact"
            );

        const contactName =
            document.getElementById(
                "contactName"
            );

        const contactAvatar =
            document.getElementById(
                "contactAvatar"
            );

        const chatName =
            document.getElementById(
                "chatName"
            );

        const chatAvatar =
            document.getElementById(
                "chatAvatar"
            );

        const chatDescription =
            document.getElementById(
                "chatDescription"
            );


        if (username === "") {

            selected.style.display =
                "none";

            contactName.textContent =
                "User";

            contactAvatar.textContent =
                "U";

            chatName.textContent =
                "Select a conversation";

            chatAvatar.textContent =
                "U";

            chatDescription.textContent =
                "Search for a username to begin.";

            return;
        }


        const firstLetter =
            username
                .charAt(0)
                .toUpperCase();


        selected.style.display =
            "flex";


        contactName.textContent =
            username;


        contactAvatar.textContent =
            firstLetter;


        chatName.textContent =
            username;


        chatAvatar.textContent =
            firstLetter;


        chatDescription.textContent =
            "Private conversation";

    }


    receiver.addEventListener(
        "input",
        function() {

            const value =
                receiver.value.trim();

            setConversation(value);

            if (value !== "") {
                loadMessages();
            }

        }
    );


    function loadMessages() {

        const user =
            receiver.value.trim();

        if (user === "") {
            return;
        }


        fetch(
            "chat?receiver=" +
            encodeURIComponent(user)
        )

        .then(function(response) {

            if (!response.ok) {

                throw new Error(
                    "HTTP " +
                    response.status
                );
            }

            return response.json();

        })

        .then(function(data) {

            messages.innerHTML = "";


            if (!data ||
                data.length === 0) {

                messages.innerHTML = `

                    <div class="welcome">

                        <div class="welcome-icon">
                            ✉
                        </div>

                        <h3>
                            No messages yet
                        </h3>

                        <p>
                            Start the conversation
                            with your first message.
                        </p>

                    </div>

                `;

                return;
            }


            data.forEach(function(item) {

                const row =
                    document.createElement(
                        "div"
                    );

                row.className =
                    "message-row";


                if (
                    item.sender ===
                    currentUser
                ) {

                    row.classList.add(
                        "mine"
                    );

                }


                const bubble =
                    document.createElement(
                        "div"
                    );

                bubble.className =
                    "bubble";


                const sender =
                    document.createElement(
                        "div"
                    );

                sender.className =
                    "sender";

                sender.textContent =
                    item.sender;


                const text =
                    document.createElement(
                        "div"
                    );

                text.className =
                    "message-text";

                text.textContent =
                    item.message;


                const time =
                    document.createElement(
                        "div"
                    );

                time.className =
                    "message-time";

                time.textContent =
                    item.time;


                bubble.appendChild(
                    sender
                );

                bubble.appendChild(
                    text
                );

                bubble.appendChild(
                    time
                );

                row.appendChild(
                    bubble
                );

                messages.appendChild(
                    row
                );

            });


            messages.scrollTop =
                messages.scrollHeight;

        })

        .catch(function(error) {

            console.error(
                "Could not load messages:",
                error
            );

        });

    }


    function sendMessage() {

        const to =
            receiver.value.trim();


        const text =
            message.value.trim();


        if (to === "") {
            receiver.focus();
            return;
        }


        if (text === "") {
            message.focus();
            return;
        }


        const data =
            new URLSearchParams();


        data.append(
            "receiver",
            to
        );


        data.append(
            "message",
            text
        );


        send.disabled = true;


        fetch(
            "chat",
            {
                method: "POST",

                headers: {
                    "Content-Type":
                        "application/x-www-form-urlencoded"
                },

                body:
                    data.toString()
            }
        )

        .then(function(response) {

            return response.text();

        })

        .then(function(result) {

            if (
                result.trim() ===
                "success"
            ) {

                message.value = "";

                loadMessages();

                message.focus();

            } else {

                alert(result);

            }

        })

        .catch(function(error) {

            console.error(
                "Send failed:",
                error
            );

            alert(
                "Unable to send the message."
            );

        })

        .finally(function() {

            send.disabled = false;

        });

    }


    message.addEventListener(
        "keydown",
        function(event) {

            if (
                event.key === "Enter" &&
                !event.shiftKey
            ) {

                event.preventDefault();

                sendMessage();
            }

        }
    );


    setInterval(
        function() {

            if (
                receiver.value.trim() !== ""
            ) {

                loadMessages();
            }

        },
        2000
    );

</script>

</body>

</html>