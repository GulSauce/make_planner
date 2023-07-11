<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/nav.css">
    <link rel="stylesheet" type="text/css" href="../../css/yt/yt.css">
    <title>YouTube</title>
</head>
<body>
    <%@ include file="../../nav.jsp"%>

    <!-- header는 상단바이니까 header태그 적는다. -->
    <header>
        <div class = "left">
            <!-- button render은 글자가 아니라 콘텐츠인데 div가 자연스럽다 -->
            <div class = "buttonRender">
                <svg>
                    <path d="M21 6H3V5h18v1zm0 5H3v1h18v-1zm0 6H3v1h18v-1z">
                    </path>
                </svg>
            </div>
            <img class = "logo" src="../../source/yt/navi/logo.png">
        <!-- KR은 콘텐츠가 글자이기 때문에 span이 자연스럽다 -->
        <span class= "country">KR</span>
        </div>

        <div class="midWide">
            <input class = "searchBar" type="text" placeholder="검색">
            <div class = "searchButtonBox">
                <svg class="svgIcon">
                    <path d="m20.87 20.17-5.59-5.59C16.35 13.35 17 11.75 17 10c0-3.87-3.13-7-7-7s-7 3.13-7 7 3.13 7 7 7c1.75 0 3.35-.65 4.58-1.71l5.59 5.59.7-.71zM10 16c-3.31 0-6-2.69-6-6s2.69-6 6-6 6 2.69 6 6-2.69 6-6 6z">
                    </path>
                </svg>
            </div>
            <span class="buttonRender mic">
                <div class = "buttonRender">
                    <svg class = "svgIcon">
                        <path d="M12 3c-1.66 0-3 1.37-3 3.07v5.86c0 1.7 1.34 3.07 3 3.07s3-1.37 3-3.07V6.07C15 4.37 13.66 3 12 3zm6.5 9h-1c0 3.03-2.47 5.5-5.5 5.5S6.5 15.03 6.5 12h-1c0 3.24 2.39 5.93 5.5 6.41V21h2v-2.59c3.11-.48 5.5-3.17 5.5-6.41z">
                        </path>
                    </svg>
                </div>  
            </span>
        </div>
        <div class = "right">
            <!-- buttonRender가 flex 속성이니까 자식 div줘도 가로로 정렬됨 -->
            <div class ="buttonRender narrowSearch">
                <svg class = "svgIcon">
                    <path d="m20.87 20.17-5.59-5.59C16.35 13.35 17 11.75 17 10c0-3.87-3.13-7-7-7s-7 3.13-7 7 3.13 7 7 7c1.75 0 3.35-.65 4.58-1.71l5.59 5.59.7-.71zM10 16c-3.31 0-6-2.69-6-6s2.69-6 6-6 6 2.69 6 6-2.69 6-6 6z">
                    </path>
                </svg>
            </div>

            <div class="buttonRender narrowMic">
                <svg class = "svgIcon">
                    <path d="M12 3c-1.66 0-3 1.37-3 3.07v5.86c0 1.7 1.34 3.07 3 3.07s3-1.37 3-3.07V6.07C15 4.37 13.66 3 12 3zm6.5 9h-1c0 3.03-2.47 5.5-5.5 5.5S6.5 15.03 6.5 12h-1c0 3.24 2.39 5.93 5.5 6.41V21h2v-2.59c3.11-.48 5.5-3.17 5.5-6.41z">
                    </path>
                </svg> 
            </div>

            <div class="buttonRender bell">
                <svg class = "svgIcon">
                    <path d="M10 20h4c0 1.1-.9 2-2 2s-2-.9-2-2zm10-2.65V19H4v-1.65l2-1.88v-5.15C6 7.4 7.56 5.1 10 4.34v-.38c0-1.42 1.49-2.5 2.99-1.76.65.32 1.01 1.03 1.01 1.76v.39c2.44.75 4 3.06 4 5.98v5.15l2 1.87zm-1 .42-2-1.88v-5.47c0-2.47-1.19-4.36-3.13-5.1-1.26-.53-2.64-.5-3.84.03C8.15 6.11 7 7.99 7 10.42v5.47l-2 1.88V18h14v-.23z">
                    </path>
                </svg>
            </div>

            <div class="buttonRender live">
                <svg class = "svgIcon">
                    <path d="M14 13h-3v3H9v-3H6v-2h3V8h2v3h3v2zm3-7H3v12h14v-6.39l4 1.83V8.56l-4 1.83V6m1-1v3.83L22 7v8l-4-1.83V19H2V5h16z">
                    </path>
                </svg>
            </div>

            <div class="avatarRender">
                <img class="avatar" src="../../source/yt/navi/avartar.jpg">
            </div>
        </div>
    </header>

    <!-- 주요한 지점으로 이동할수 있는 요소는 좌측 메뉴니까 nav태그 적는다. -->
    <div>
        <img class = "menu" src="../../source/yt/menu/miniMenu.png">
    </div>

    <!-- <div class="movieSort"> -->
        <!-- moiveSort는 단순히 정렬 용, movies부터 본문이 시작되니까 main태그 적는다-->
        <main>
            <!-- 영상이라는 공통점이 있고 이 논리적 요소를 분리하기 위해 section을 사용한다. -->
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section><section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
            <section>
                <a href="https://www.youtube.com/watch?v=QorEUDWlJlE">
                    <img class ="thumbnail" src ="../../source/yt/moives/movie3.png">
                </a>
                <div class="movieInfo">
                    <img class="channelLogo" src ="../../source/yt/moives/channelLogo2.png">
                    <!-- 영상에서 제일 중요한 요소인 제목, 채널이름 조회수에 article태그 적는다. -->
                    <article class="movieText">
                        <h1 class="title">[자막뉴스] 미국 국가 부도 우려...JP모건, 전시상황실 설치 / YTN</h1>
                        <span class="channelName">YTN</span>
                        <span class="viewCnt">조회수 11만회</span>
                        <span class="uploadDate">3일전</span>
                    </article>
                </div>
            </section>
        </main>
    <!-- </div> -->
    <script src="../../js/nav.js"></script>
</body>
</html>