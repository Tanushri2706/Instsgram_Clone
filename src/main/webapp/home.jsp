<%@ page import="com.mongodb.client.*,org.bson.Document,java.util.*" %>
<%@ include file="navbar.jsp" %>
<%
    String user = (String) session.getAttribute("user");
    if(user==null){ response.sendRedirect("login.jsp"); }
    
    // Database connection
    MongoDatabase db = com.instagram.servlet.MongoDBConnection.getDatabase();
    MongoCollection<Document> posts = db.getCollection("posts");
    List<Document> allPosts = posts.find().into(new ArrayList<Document>());
%>
<!DOCTYPE html>
<html>
<head>
    <title>InstaClone Feed</title>
    <style>
        * { box-sizing: border-box; }
        body { background-color: #fafafa; margin: 0; padding-top: 80px; overflow-x: hidden; }
        
        .main-container { 
            display: flex; 
            justify-content: center; 
            max-width: 1000px; 
            margin: 0 auto; 
            padding: 0 20px;
        }

        /* LEFT FRAME: Fixed Navigation */
        .left-sidebar { 
            width: 220px; 
            position: fixed; 
            left: calc(50% - 500px); 
            top: 100px;
        }
        .nav-link { 
            display: flex; align-items: center; padding: 12px; 
            text-decoration: none; color: #262626; font-size: 16px;
            transition: 0.2s; border-radius: 8px;
        }
        .nav-link:hover { background: #f2f2f2; font-weight: bold; }
        .nav-link i { margin-right: 15px; font-size: 22px; width: 25px; text-align: center; }

        /* MIDDLE FRAME: The Feed */
        .feed-section { width: 470px; margin-left: 240px; margin-right: 20px; }
        
        .post-card { 
            background: white; border: 1px solid #dbdbdb; 
            border-radius: 8px; margin-bottom: 25px; width: 100%;
        }
        .post-header { padding: 12px; display: flex; align-items: center; justify-content: space-between; }
        .user-info { display: flex; align-items: center; font-weight: 600; font-size: 14px; }
        .user-info img { width: 32px; height: 32px; border-radius: 50%; margin-right: 10px; border: 1px solid #dbdbdb; }
        
        .post-img-container { width: 100%; background: #efefef; }
        .post-img-container img { width: 100%; display: block; object-fit: contain; }
        
        .post-footer { padding: 12px; }
        .action-icons { display: flex; gap: 16px; margin-bottom: 8px; font-size: 22px; }
        .action-icons i { cursor: pointer; transition: 0.2s; }
        .action-icons i:hover { color: #8e8e8e; }

        /* RIGHT FRAME: Suggestions */
        .right-sidebar { width: 300px; padding-top: 10px; }
        .profile-switch { display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; }
        .suggestion-list { margin-top: 15px; }
        .suggest-user { display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px; font-size: 14px; }
        
        @media (max-width: 900px) {
            .right-sidebar, .left-sidebar { display: none; }
            .feed-section { margin: 0 auto; }
        }
    </style>
</head>
<body>

<div class="main-container">
    
    <div class="left-sidebar">
        <a href="home.jsp" class="nav-link"><i class="fa-solid fa-house"></i> Home</a>
        <a href="explore.jsp" class="nav-link"><i class="fa-solid fa-compass"></i> Explore</a>
        <a href="#" class="nav-link"><i class="fa-solid fa-paper-plane"></i> Messages</a>
        <a href="profile.jsp" class="nav-link"><i class="fa-solid fa-circle-user"></i> Profile</a>
        <a href="createPost.jsp" class="nav-link"><i class="fa-solid fa-square-plus"></i> Create Post</a>
    </div>

    <div class="feed-section">
        <% 
            // Agar database khali hai toh dummy data dikhao
            int displayCount = (allPosts.size() > 0) ? allPosts.size() : 10;
            Random rand = new Random();
            
            for(int i=0; i < displayCount; i++) { 
                String postUser, postContent, postImg;
                
                if(allPosts.size() > 0 && i < allPosts.size()) {
                    Document p = allPosts.get(i);
                    postUser = p.getString("user");
                    postContent = p.getString("content");
                    postImg = p.getString("image");
                } else {
                    // DYNAMIC DUMMY DATA (Refresh pe change hoga)
                    postUser = "user_" + (rand.nextInt(999) + 100);
                    postContent = "Enjoying the vibe! #instaclone #coding";
                    postImg = "https://picsum.photos/600/600?random=" + rand.nextInt(1000);
                }
                
                if(postImg == null || postImg.isEmpty()) postImg = "https://picsum.photos/600/600?random=" + i;
        %>
        <div class="post-card">
            <div class="post-header">
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=<%= postUser %>&background=random">
                    <%= postUser %>
                </div>
                <i class="fa-solid fa-ellipsis"></i>
            </div>
            
            <div class="post-img-container">
                <img src="<%= postImg %>" alt="Post">
            </div>

            <div class="post-footer">
                <div class="action-icons">
                    <i class="fa-regular fa-heart"></i>
                    <i class="fa-regular fa-comment"></i>
                    <i class="fa-regular fa-paper-plane"></i>
                </div>
                <p style="margin: 5px 0;"><b><%= postUser %></b> <%= postContent %></p>
                <small style="color: #8e8e8e; text-transform: uppercase; font-size: 10px;">2 HOURS AGO</small>
            </div>
        </div>
        <% } %>
    </div>

    <div class="right-sidebar">
        <div class="profile-switch">
            <div style="display:flex; align-items:center;">
                <img src="https://ui-avatars.com/api/?name=<%= user %>&background=0095f6&color=fff" style="width:50px; border-radius:50%; margin-right:12px;">
                <div>
                    <div style="font-weight:600; font-size:14px;"><%= user %></div>
                    <div style="color:#8e8e8e; font-size:14px;">Welcome Back!</div>
                </div>
            </div>
            <a href="logout" style="color:#0095f6; font-size:12px; font-weight:600; text-decoration:none;">Switch</a>
        </div>

        <div class="suggestion-list">
            <div style="display:flex; justify-content:space-between; margin-bottom:15px;">
                <span style="color:#8e8e8e; font-weight:600; font-size:14px;">Suggested for you</span>
                <span style="font-size:12px; font-weight:600; cursor:pointer;">See All</span>
            </div>
            
            <% for(int j=0; j<5; j++) { 
                int randomId = rand.nextInt(100);
            %>
            <div class="suggest-user">
                <div style="display:flex; align-items:center;">
                    <img src="https://i.pravatar.cc/150?u=<%= randomId %>" style="width:32px; height:32px; border-radius:50%; margin-right:10px;">
                    <div>
                        <div style="font-weight:600; font-size:13px;">insta_user_<%= randomId %></div>
                        <div style="color:#8e8e8e; font-size:11px;">Followed by friends</div>
                    </div>
                </div>
                <span style="color:#0095f6; font-size:12px; font-weight:600; cursor:pointer;">Follow</span>
            </div>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>