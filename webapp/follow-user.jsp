<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@page import="java.sql.*" %>

<%
    try {
        if (db.userid(request) != null) {
            String currentUserId = db.userid(request);
            String targetUserId = request.getParameter("userId");
            String token = request.getParameter("csrf");
            
            if (db.verifycsrftoken(token) && targetUserId != null && !targetUserId.equals(currentUserId)) {
                Connection conn = null;
                PreparedStatement pstmt = null;
                
                try {
                    Class.forName(db.name());
                    String unamef = db.uname().concat("i");
                    String passf = db.pass().concat("09");
                    conn = (Connection)DriverManager.getConnection(db.urlus(), unamef, passf);
                    
                    // Check for the latest/most recent record for this user
                    String checkQuery = "SELECT yorn FROM `" + currentUserId + "` WHERE forufid = ? ORDER BY time DESC LIMIT 1";
                    pstmt = conn.prepareStatement(checkQuery);
                    pstmt.setString(1, targetUserId);
                    ResultSet rs = pstmt.executeQuery();
                    
                    boolean shouldFollow = true;
                    if (rs.next()) {
                        int latestYorn = rs.getInt(1);
                        // If the latest record shows we're following (yorn = 0), then we shouldn't follow again
                        if (latestYorn == 0) {
                            shouldFollow = false;
                        }
                        // If latest record shows we unfollowed (yorn = 1), we can follow again
                        // If latest record shows any other relationship, we can follow
                    }
                    
                    if (shouldFollow) {
                        // Get user info for the database insert
                        String[] targetUserInfo = db.nameico(targetUserId);
                        String[] currentUserInfo = db.nameico(currentUserId);
                        
                        if (targetUserInfo != null && currentUserInfo != null) {
                            // Add to current user's following list (yorn = 0 means following)
                            String insertQuery = "INSERT INTO `" + currentUserId + "` (forufid, yorn, fname, sname, fullname, time) VALUES (?, 0, ?, ?, ?, ?)";
                            pstmt = conn.prepareStatement(insertQuery);
                            pstmt.setString(1, targetUserId);
                            pstmt.setString(2, targetUserInfo[0].split(" ")[0]); // First name
                            pstmt.setString(3, targetUserInfo[0].split(" ").length > 1 ? targetUserInfo[0].split(" ")[1] : ""); // Last name
                            pstmt.setString(4, targetUserInfo[0]); // Full name
                            pstmt.setString(5, db.time());
                            pstmt.executeUpdate();
                            
                            // Add current user to target user's followers list (yorn = 1 means follower)
                            String insertFollowerQuery = "INSERT INTO `" + targetUserId + "` (forufid, yorn, fname, sname, fullname, time) VALUES (?, 1, ?, ?, ?, ?)";
                            pstmt = conn.prepareStatement(insertFollowerQuery);
                            pstmt.setString(1, currentUserId);
                            pstmt.setString(2, currentUserInfo[0].split(" ")[0]); // First name
                            pstmt.setString(3, currentUserInfo[0].split(" ").length > 1 ? currentUserInfo[0].split(" ")[1] : ""); // Last name
                            pstmt.setString(4, currentUserInfo[0]); // Full name
                            pstmt.setString(5, db.time());
                            pstmt.executeUpdate();
                            
                            session.setAttribute("msg", "You are now following this user!");
                        } else {
                            session.setAttribute("msg", "Error: User information not found.");
                        }
                    } else {
                        session.setAttribute("msg", "You are already following this user!");
                    }
                    
                } catch (Exception ex) {
                    session.setAttribute("msg", "Error following user. Please try again.");
                    System.out.println("Error in follow-user.jsp: " + ex);
                } finally {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            } else {
                session.setAttribute("msg", "Invalid request.");
            }
        } else {
            response.sendRedirect("login.jsp");
            return;
        }
    } catch (Exception ex) {
        session.setAttribute("msg", "An error occurred. Please try again.");
        System.out.println("Error in follow-user.jsp: " + ex);
    }
    
    // Redirect back to index page
    response.sendRedirect("index.jsp");
%> 