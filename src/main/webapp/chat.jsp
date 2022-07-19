<%-- 
    Document   : chat
    Created on : Feb 14, 2022, 4:54:26 PM
    Author     : Ahmed
--%>

<%@page import="com.Models.ChatSession"%>
<%@page import="com.Dao.SessionDao"%>
<%@page import="java.util.Collections"%>
<%@page import="com.Models.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.Dao.MessageDao"%>
<%@page import="com.Models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    User user = (User) session.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
    }
    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat</title>
        
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="css/style.css" />
        <script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
    </head>
    <body>
        <div class="container text-start text-white">
            
            <div>
                <%
                    User chatWith = (User) session.getAttribute("chatuser");
                %>
                
                <div class="chatinfo text-start">
                    <img src="<%=chatWith.getImg()%>" width="100" height="100" alt="alt"/>
                    <div class="mt-3">
                        <h4><%=chatWith.getFullName()%></h4>
                        <h6><%=chatWith.getEmail()%></h6>
                    </div>
                </div>
                
                <div id="chat" class="chat">
                    <%  
                        MessageDao dao = new MessageDao(DBConnect.getConn());
                        List<Message> messages = dao.getUserMessages(user.getId(), chatWith.getId());
                        Collections.reverse(messages);
                        for(Message msg : messages){
                            if(msg.getFrom_id() == user.getId()){
                                %>
                                <div class="msgtx text-start">
                                    <div id="tx">
                                        <h4><%=msg.getMsg()%></h4>
                                        <h6><%=msg.getDate_time()%></h6>
                                    </div>
                                </div>
                                <%
                            }else{
                                %>
                                <div  class="msgrx text-end">
                                    <div style="background-color: white; width: 65%;" id="rx">
                                        
                                    </div>
                                    <div id="rx">
                                        <h4><%=msg.getMsg()%></h4>
                                        <h6><%=msg.getDate_time()%></h6>
                                    </div>
                                </div>
                                <%
                            }
                            %>
                            <%
                        }
                    %>
                </div>
                <br>
                
                <div class="msgctrl">
                    <div>
                        <input class="form-control" id="textmsg" type="text" placeholder="Type a Message ..." name="message"/>
                    </div>

                    <div>
                        <input class="btn btn-dark ms-3" onclick="return sendMsg();" type="submit" value="Send"/>
                    </div>
                </div>
            
            </div>
            
        </div>
                
                
        <script>
            var wsUrl;
            if (window.location.protocol == 'http:') {
                wsUrl = 'ws://';
            } else {
                wsUrl = 'wss://';
            }
            
            <%
                SessionDao sdao = new SessionDao(DBConnect.getConn());
                ChatSession cs = sdao.getSession(user.getId(), chatWith.getId());
            %>
                
            //document.getElementById("sesid").innerText = "Session Id : " + <%=cs.getSession()%>;
            
            var ws = new WebSocket(wsUrl + window.location.host + "/chatapp/messages/" + <%=cs.getSession()%>);

            ws.onmessage = function(event) {
                var msgData = document.getElementById("chat");
                const json  = event.data.toString();
                console.log(json);
                const obj = JSON.parse(json);
                console.log(obj);
                if(obj.from_id === <%=user.getId()%>){
                    msgData.innerHTML=`<div class="msgtx text-start">
                                    <div id="tx">
                                        <h4>` + obj.msg + `</h4>
                                        <h6>` + obj.date_time + `</h6>
                                    </div>
                                </div>` + msgData.innerHTML+"<br/>";
                    //msgData.innerHTML=obj.msg+"<br/>" + obj.date_time+"<br/>" + msgData.innerHTML+"<br/>";
                } else{
                    msgData.innerHTML=`<div  class="msgrx text-end">
                                    <div style="background-color: white; width: 65%;" id="rx">
                                        
                                    </div>
                                    <div id="rx">
                                        <h4>` + obj.msg + `</h4>
                                        <h6>` + obj.date_time + `</h6>
                                    </div>
                                </div>` + msgData.innerHTML+"<br/>";
                }
                
            };

            ws.onerror = function(event){
                console.log("Error ", event)
            } 
            
            function sendMsg() {
                var msg = document.getElementById("textmsg").value;
                if(msg)
                {
                    ws.send(JSON.stringify({
                        "id": 0,
                        "from_id": <%=user.getId()%>,
                        "to_id": <%=chatWith.getId()%>,
                        "msg": msg,
                        "date_time": "date_time",
                        "session": <%=cs.getSession()%>
                    }));
                }
                document.getElementById("textmsg").value="";
            }
            
        </script>
                
    </body>
</html>
