# InstaClone (JSP + Servlet + MongoDB) — Eclipse Setup

This project is a simple Instagram-like clone built with **JSP**, **Jakarta Servlets** (Tomcat 10), and **MongoDB**.

## Tech Stack

- **Java**: 21
- **Server**: Apache Tomcat **10.1** (Jakarta Servlet 6.0)
- **UI**: JSP pages in `src/main/webapp`
- **Database**: MongoDB (local)

## Prerequisites

- **Eclipse IDE for Enterprise Java and Web Developers** (recommended)
- **JDK 21** installed and configured in Eclipse
- **Apache Tomcat 10.1** added in Eclipse (Servers view)
- **MongoDB** running locally

## Database Configuration

MongoDB connection settings are in `src/main/java/com/instagram/servlet/MongoDBConnection.java`:

- **URI**: `mongodb://localhost:27017`
- **Database name**: `instagram`
- Collections used:
  - `users`
  - `posts`

Start MongoDB (default local install):

```bash
mongod
```

Optional: open the Mongo shell and verify:

```bash
mongosh
use instagram
show collections
```

## Import in Eclipse

This repo already contains Eclipse project files (`.project`, `.classpath`), so you can import it directly:

- **File → Import… → General → Existing Projects into Workspace**
- Select the folder: `D:\Project\instagram\instagram`
- Finish

## Configure Tomcat in Eclipse

- Open **Servers** view (Window → Show View → Servers)
- **Add New Server… → Apache → Tomcat v10.1 Server**
- Point it to your Tomcat 10.1 installation
- Make sure the project targets Tomcat 10.1:
  - Right click project → **Properties → Targeted Runtimes** → check your Tomcat 10.1 runtime

## Add MongoDB Java Driver (Required)

Your code uses:

- `com.mongodb.client.*`
- `org.bson.Document`

So you must add the **MongoDB Java driver jars** to the project/runtime.

### Option A (simple): Add driver jars to `WEB-INF/lib`

1. Create the folder:
   - `src/main/webapp/WEB-INF/lib/`
2. Download the MongoDB Java driver jars and place them into that folder.
   - Recommended artifact family: **mongodb-driver-sync**
3. In Eclipse:
   - Right click project → **Properties → Java Build Path → Libraries → Add JARs…**
   - Select the jars under `src/main/webapp/WEB-INF/lib`
4. Ensure they are deployed to Tomcat:
   - Right click project → **Properties → Deployment Assembly**
   - Confirm the jars appear under **WEB-INF/lib**

### Option B (recommended): Convert to Maven (optional)

If you prefer dependency management, convert the project to Maven and add MongoDB driver dependencies.
(This repo currently has no `pom.xml`.)

## Run the App

1. Ensure **MongoDB is running**.
2. In Eclipse:
   - Right click project → **Run As → Run on Server**
   - Choose your **Tomcat 10.1** server
3. Open the app in your browser:
   - `http://localhost:8080/instagram/`

> Note: The context path is usually the Eclipse project name (`instagram`). If yours differs, use that context path instead.

## Main Pages and Routes

JSP pages live in `src/main/webapp`:

- `index.jsp` (landing)
- `signup.jsp` (register)
- `login.jsp` (login)
- `home.jsp` (feed)
- `createPost.jsp` (create post)
- `profile.jsp`, `explore.jsp`, `settings.jsp`

Servlet endpoints (annotations in `src/main/java/com/instagram/servlet`):

- `POST /signup` → `SignupServlet`
- `POST /login` → `LoginServlet`
- `POST /post` → `PostServlet`
- `GET /logout` → `LogoutServlet`

## Troubleshooting

### 1) `ClassNotFoundException: com.mongodb...` or compile errors for `org.bson...`

You haven’t added the MongoDB driver jars yet. Follow **Add MongoDB Java Driver** above.

### 2) 404 after deploying

- Confirm you opened: `http://localhost:8080/<context>/index.jsp` (or just `/` if configured)
- Confirm the project is added to the Tomcat server in **Servers** view.

### 3) Session/login not working as expected

- `home.jsp` requires a session attribute named `user` (set by `LoginServlet`).
- Use the app flow: **Sign up → Log in → Home**.

