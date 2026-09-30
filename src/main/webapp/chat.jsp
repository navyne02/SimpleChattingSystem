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

    <title>Connect</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {

            width: 100%;

            height: 100vh;

            overflow: hidden;

            font-family:
                "Segoe UI",
                Arial,
                sans-serif;

            color: #172033;

            background: #eef2f7;
        }


        .app {

            width: 100%;

            height: 100vh;

            display: flex;

            background: #ffffff;
        }


        /* SIDEBAR */

        .sidebar {

            width: 330px;

            flex-shrink: 0;

            display: flex;

            flex-direction: column;

            background: #ffffff;

            border-right:
                1px solid
                #e6ebf1;
        }


        .sidebar-header {

            height: 70px;

            padding: 0 20px;

            display: flex;

            align-items: center;

            border-bottom:
                1px solid
                #edf0f4;
        }


        .brand {

            display: flex;

            align-items: center;

            gap: 10px;
        }


        .brand-icon {

            width: 38px;

            height: 38px;

            border-radius: 11px;

            background: #2563eb;

            color: white;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 18px;
        }


        .brand-name {

            color: #172033;

            font-size: 16px;

            font-weight: 700;
        }


        .brand-caption {

            color: #9099a8;

            font-size: 9px;

            margin-top: 2px;
        }


        /* CURRENT USER */

        .account {

            padding: 17px;

            display: flex;

            align-items: center;

            gap: 11px;

            border-bottom:
                1px solid
                #edf0f4;
        }


        .account-avatar {

            width: 44px;

            height: 44px;

            flex-shrink: 0;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #dbeafe;

            color: #2563eb;

            font-weight: 700;

            font-size: 15px;
        }


        .account-info {

            min-width: 0;
        }


        .account-name {

            color: #172033;

            font-size: 13px;

            font-weight: 700;

            overflow: hidden;

            white-space: nowrap;

            text-overflow: ellipsis;
        }


        .account-status {

            margin-top: 4px;

            display: flex;

            align-items: center;

            gap: 5px;

            color: #16a34a;

            font-size: 10px;
        }


        .online-dot {

            width: 7px;

            height: 7px;

            border-radius: 50%;

            background: #22c55e;
        }


        /* SEARCH */

        .conversation-title {

            padding:
                18px
                18px
                10px;

            color: #7e8998;

            text-transform: uppercase;

            letter-spacing: .7px;

            font-size: 10px;

            font-weight: 700;
        }


        .search-area {

            padding:
                0
                16px
                15px;
        }


        .search {

            width: 100%;

            height: 42px;

            padding:
                0
                13px;

            border:
                1px solid
                #dfe5ec;

            border-radius: 10px;

            outline: none;

            background: #f7f9fb;

            color: #172033;

            font-size: 12px;
        }


        .search::placeholder {
            color: #9ca6b4;
        }


        .search:focus {

            background: white;

            border-color: #60a5fa;

            box-shadow:
                0 0 0 3px
                rgba(59,130,246,.08);
        }


        /* SELECTED USER */

        .selected-user {

            display: none;

            align-items: center;

            gap: 10px;

            margin:
                0
                11px;

            padding: 11px;

            border-radius: 11px;

            background: #eff6ff;

            border:
                1px solid
                #dbeafe;
        }


        .selected-avatar {

            width: 42px;

            height: 42px;

            flex-shrink: 0;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #dbeafe;

            color: #2563eb;

            font-weight: 700;
        }


        .selected-info {

            min-width: 0;

            flex: 1;
        }


        .selected-name {

            color: #172033;

            font-size: 12px;

            font-weight: 700;

            overflow: hidden;

            text-overflow: ellipsis;

            white-space: nowrap;
        }


        .selected-status {

            color: #8090a2;

            font-size: 9px;

            margin-top: 4px;
        }


        /* MAIN CHAT */

        .chat {

            flex: 1;

            min-width: 0;

            height: 100%;

            display: flex;

            flex-direction: column;

            background: #f8fafc;
        }


        /* HEADER */

        .chat-header {

            height: 70px;

            flex-shrink: 0;

            padding:
                0
                22px;

            display: flex;

            align-items: center;

            gap: 11px;

            background: white;

            border-bottom:
                1px solid
                #e6ebf1;
        }


        .header-avatar {

            width: 42px;

            height: 42px;

            flex-shrink: 0;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #e5e7eb;

            color: #64748b;

            font-weight: 700;

            font-size: 14px;
        }


        .header-info {

            min-width: 0;
        }


        .header-name {

            color: #172033;

            font-size: 13px;

            font-weight: 700;
        }


        .header-status {

            margin-top: 4px;

            color: #8b96a5;

            font-size: 9px;
        }


        /* MESSAGES */

        .messages {

            flex: 1;

            min-height: 0;

            overflow-y: auto;

            padding:
                26px;

            background:

                linear-gradient(
                    180deg,
                    #f8fafc,
                    #f5f8fb
                );
        }


        .empty {

            width: 100%;

            height: 100%;

            display: flex;

            flex-direction: column;

            align-items: center;

            justify-content: center;

            text-align: center;

            color: #96a1af;
        }


        .empty-icon {

            width: 66px;

            height: 66px;

            margin-bottom: 15px;

            display: flex;

            justify-content: center;

            align-items: center;

            border-radius: 18px;

            background: #eaf2ff;

            color: #2563eb;

            font-size: 26px;
        }


        .empty h3 {

            color: #4b5565;

            font-size: 15px;

            margin-bottom: 7px;
        }


        .empty p {

            max-width: 310px;

            color: #98a2b0;

            line-height: 1.6;

            font-size: 11px;
        }


        /* MESSAGE ROW */

        .message-row {

            display: flex;

            width: 100%;

            margin-bottom: 13px;
        }


        .message-row.mine {

            justify-content: flex-end;
        }


        .bubble {

            max-width: 66%;

            padding:
                11px 13px;

            border-radius: 15px;

            background: white;

            border:
                1px solid
                #e2e8f0;

            box-shadow:
                0 2px 7px
                rgba(30,50,80,.04);
        }


        .message-row:not(.mine)
        .bubble {

            border-bottom-left-radius: 4px;
        }


        .message-row.mine
        .bubble {

            background: #2563eb;

            color: white;

            border-color: #2563eb;

            border-bottom-right-radius: 4px;

            box-shadow:
                0 3px 8px
                rgba(37,99,235,.15);
        }


        .sender {

            margin-bottom: 5px;

            color: #6b7280;

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

            color: #9aa4b2;

            text-align: right;

            font-size: 8px;
        }


        .message-row.mine
        .message-time {

            color:
                rgba(255,255,255,.65);
        }


        /* COMPOSER */

        .composer {

            flex-shrink: 0;

            padding:
                12px
                18px;

            background: white;

            border-top:
                1px solid
                #e6ebf1;
        }


        .composer-box {

            display: flex;

            align-items: center;

            gap: 8px;

            padding:
                5px
                6px
                5px
                14px;

            border:
                1px solid
                #dce3ea;

            background: #f8fafc;

            border-radius: 13px;
        }


        .message-input {

            flex: 1;

            min-width: 0;

            height: 38px;

            border: none;

            outline: none;

            background: transparent;

            color: #172033;

            font-size: 13px;
        }


        .message-input::placeholder {
            color: #a0a9b5;
        }


        .send-button {

            width: 40px;

            height: 40px;

            flex-shrink: 0;

            border: none;

            border-radius: 11px;

            background: #2563eb;

            color: white;

            font-size: 16px;

            cursor: pointer;

            transition: .2s;
        }


        .send-button:hover {

            background: #1d4ed8;

            transform:
                translateY(-1px);
        }


        .send-button:active {

            transform:
                translateY(0);
        }


        .send-button:disabled {

            opacity: .45;

            cursor: default;

            transform: none;
        }


        ::-webkit-scrollbar {

            width: 6px;
        }


        ::-webkit-scrollbar-track {

            background: transparent;
        }


        ::-webkit-scrollbar-thumb {

            background: #d5dce5;

            border-radius: 10px;
        }


        @media (max-width: 750px) {

            .sidebar {
                width: 270px;
            }

            .bubble {
                max-width: 78%;
            }

        }


        @media (max-width: 580px) {

            .sidebar {
                display: none;
            }

            .chat-header {
                padding:
                    0
                    14px;
            }

            .messages {
                padding:
                    16px
                    12px;
            }

            .composer {
                padding:
                    9px;
            }

            .bubble {
                max-width: 90%;
            }

        }

    </style>

</head>


<body>


<div class="app">


    <!-- SIDEBAR -->

    <aside class="sidebar">


        <div class="sidebar-header">

            <div class="brand">

                <div class="brand-icon">
                    💬
                </div>

                <div>

                    <div class="brand-name">
                        Connect
                    </div>

                    <div class="brand-caption">
                        Messaging
                    </div>

                </div>

            </div>

        </div>


        <!-- CURRENT USER -->

        <div class="account">

            <div class="account-avatar">

                <%= username.substring(0, 1)
                    .toUpperCase() %>

            </div>


            <div class="account-info">

                <div class="account-name">

                    <%= username %>

                </div>


                <div class="account-status">

                    <span class="online-dot"></span>

                    Online

                </div>

            </div>

        </div>


        <div class="conversation-title">

            Messages

        </div>


        <!-- SEARCH / RECEIVER -->

        <div class="search-area">

            <input
                id="receiver"
                class="search"
                type="text"
                placeholder="Search username..."
                autocomplete="off">

        </div>


        <!-- SELECTED CONTACT -->

        <div
            id="selectedUser"
            class="selected-user">

            <div
                id="selectedAvatar"
                class="selected-avatar">

                U

            </div>


            <div class="selected-info">

                <div
                    id="selectedName"
                    class="selected-name">

                    User

                </div>

                <div class="selected-status">

                    Conversation

                </div>

            </div>

        </div>


    </aside>


    <!-- CHAT -->

    <main class="chat">


        <!-- CHAT HEADER -->

        <header class="chat-header">


            <div
                id="headerAvatar"
                class="header-avatar">

                U

            </div>


            <div class="header-info">

                <div
                    id="headerName"
                    class="header-name">

                    Select a conversation

                </div>


                <div
                    id="headerStatus"
                    class="header-status">

                    Search for a user to begin

                </div>

            </div>


        </header>


        <!-- MESSAGES -->

        <section
            id="messages"
            class="messages">


            <div class="empty">


                <div class="empty-icon">
                    💬
                </div>


                <h3>

                    Start a conversation

                </h3>


                <p>

                    Search for another registered
                    user and start your conversation.

                </p>


            </div>


        </section>


        <!-- COMPOSER -->

        <div class="composer">


            <div class="composer-box">


                <input
                    id="message"
                    class="message-input"
                    type="text"
                    placeholder="Write a message..."
                    autocomplete="off">


                <button
                    id="sendButton"
                    class="send-button"
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
        document.getElementById(
            "receiver"
        );


    const messageInput =
        document.getElementById(
            "message"
        );


    const messages =
        document.getElementById(
            "messages"
        );


    const sendButton =
        document.getElementById(
            "sendButton"
        );


    let previousMessageCount = 0;


    /*
     * Update selected conversation
     */

    function updateUserInterface(
        username
    ) {

        const selectedUser =
            document.getElementById(
                "selectedUser"
            );


        const selectedName =
            document.getElementById(
                "selectedName"
            );


        const selectedAvatar =
            document.getElementById(
                "selectedAvatar"
            );


        const headerName =
            document.getElementById(
                "headerName"
            );


        const headerAvatar =
            document.getElementById(
                "headerAvatar"
            );


        const headerStatus =
            document.getElementById(
                "headerStatus"
            );


        if (username === "") {

            selectedUser.style.display =
                "none";


            headerName.textContent =
                "Select a conversation";


            headerAvatar.textContent =
                "U";


            headerStatus.textContent =
                "Search for a user to begin";


            return;
        }


        const firstLetter =
            username
                .charAt(0)
                .toUpperCase();


        selectedUser.style.display =
            "flex";


        selectedName.textContent =
            username;


        selectedAvatar.textContent =
            firstLetter;


        headerName.textContent =
            username;


        headerAvatar.textContent =
            firstLetter;


        headerStatus.textContent =
            "Private conversation";

    }


    /*
     * User search
     */

    receiver.addEventListener(
        "input",
        function() {

            const username =
                receiver.value.trim();


            updateUserInterface(
                username
            );


            if (username === "") {

                previousMessageCount = 0;


                messages.innerHTML = `

                    <div class="empty">

                        <div class="empty-icon">
                            💬
                        </div>

                        <h3>
                            Start a conversation
                        </h3>

                        <p>
                            Search for another
                            registered user and
                            start your conversation.
                        </p>

                    </div>

                `;

                return;
            }


            loadMessages();

        }
    );


    /*
     * Load messages
     */

    function loadMessages() {

        const username =
            receiver.value.trim();


        if (username === "") {
            return;
        }


        fetch(
            "chat?receiver=" +
            encodeURIComponent(
                username
            )
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


            const oldScroll =
                messages.scrollTop;


            const wasAtBottom =
                messages.scrollHeight -
                messages.clientHeight -
                oldScroll <
                80;


            messages.innerHTML = "";


            if (
                !data ||
                data.length === 0
            ) {

                messages.innerHTML = `

                    <div class="empty">

                        <div class="empty-icon">
                            ✉
                        </div>

                        <h3>
                            No messages yet
                        </h3>

                        <p>
                            Send the first message
                            to start the conversation.
                        </p>

                    </div>

                `;

                previousMessageCount = 0;

                return;
            }


            data.forEach(
                function(item) {


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

                }
            );


            /*
             * Scroll to bottom when:
             *
             * 1. New conversation loaded
             * 2. User was already near bottom
             * 3. New messages arrived
             */

            if (
                wasAtBottom ||
                data.length !==
                previousMessageCount
            ) {

                messages.scrollTop =
                    messages.scrollHeight;

            }


            previousMessageCount =
                data.length;

        })


        .catch(function(error) {

            console.error(
                "Could not load messages:",
                error
            );

        });

    }


    /*
     * Send message
     */

    function sendMessage() {


        const to =
            receiver.value.trim();


        const text =
            messageInput.value.trim();


        if (to === "") {

            receiver.focus();

            return;
        }


        if (text === "") {

            messageInput.focus();

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


        sendButton.disabled =
            true;


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

                messageInput.value =
                    "";


                loadMessages();


                messageInput.focus();

            } else {

                alert(result);

            }

        })


        .catch(function(error) {

            console.error(
                "Message sending failed:",
                error
            );


            alert(
                "Unable to send the message."
            );

        })


        .finally(function() {

            sendButton.disabled =
                false;

        });

    }


    /*
     * Enter = send
     */

    messageInput.addEventListener(
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


    /*
     * AJAX polling
     *
     * Checks for new messages
     * every 2 seconds.
     */

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