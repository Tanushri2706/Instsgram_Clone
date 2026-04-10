<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Explore • InstaClone</title>
    <style>
        .explore-container {
            max-width: 935px;
            margin: 20px auto;
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 columns */
            gap: 15px;
            padding: 10px;
        }
        .explore-item {
            position: relative;
            width: 100%;
            padding-top: 100%; /* Square Aspect Ratio */
            overflow: hidden;
            cursor: pointer;
        }
        .explore-item img {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            object-fit: cover;
            transition: 0.3s;
        }
        .overlay {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0,0,0,0.3);
            display: flex; justify-content: center; align-items: center;
            color: white; opacity: 0; transition: 0.3s;
            font-size: 18px;
        }
        .explore-item:hover .overlay { opacity: 1; }
        .explore-item:hover img { transform: scale(1.1); }
    </style>
</head>
<body>

<div class="explore-container">
    <% 
       // Loop to show 16 images
       for(int i=1; i<=16; i++) { 
           // Using Unsplash source API for high quality dynamic images
           String exploreImg = "https://picsum.photos/500/500?random=" + (i + 100);
    %>
    <div class="explore-item">
        <img src="<%= exploreImg %>" alt="Explore Image">
        <div class="overlay">
            <span><i class="fa-solid fa-heart"></i> <%= (int)(Math.random()*500) %></span>
            <span style="margin-left:20px;"><i class="fa-solid fa-comment"></i> <%= (int)(Math.random()*50) %></span>
        </div>
    </div>
    <% } %>
</div>

</body>
</html>