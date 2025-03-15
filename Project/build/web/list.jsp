

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELLPHONES Page</title>
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript">
            function setCheck(obj) {
                var fries = document.getElementsByName('cidd');
                if ((obj.id == 'c0') && (fries[0].checked == true)) {
                    for (var i = 1; i < fries.length; i++)
                        fries[i].checked = false;
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                document.getElementById('f1').submit();
            }
            function setCheck1(obj) {
                var fries = document.getElementsByName('price');
                if ((obj.id == 'g0') && (fries[0].checked == true)) {
                    for (var i = 1; i < fries.length; i++)
                        fries[i].checked = false;
                } else {
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                document.getElementById('f2').submit();
            }
            function buy(id) {
                var m = document.f.num.value;
                document.f.action = "buy?id=" + id + "&num=" + m;
                document.f.submit();
            }
        </script>
    </head>
    <body>
        <div id="wrapper">
            <a href="home"> <img src="images/home_icon.png" width="40px" height="40px" alt="home"/></a>
            <div>
                <c:if test="${sessionScope.account!=null}"> 
                    <div style="text-align: right">
                        <a href="ProductManagerServlet">
                            Product Manager
                        </a>
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                        <a href="buy1?service=showcart">
                            Show cart items
                        </a>
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                        <a href="logout"> 
                            Logout 
                        </a> 
                        &nbsp;&nbsp;&nbsp; 
                        <span style="color:red">[ ${sessionScope.account.username} ]</span> 
                    </div>
                </c:if> 
                <c:if test="${sessionScope.account==null}">
                    <div style="text-align: right">
                        <a href="register.jsp">
                            Register
                        </a>
                        ||
                        <a href="login"> 
                            Login 
                        </a> 
                    </div>
                </c:if>
            </div>
            <!--            <div>
                            <form action="home1" method="gets">
                            <input type="number" name="from" placeholder="from"/>
                            <input type="number" name="to" placeholder="to"/>
                            <input type="submit" value="Submit"/>
                            </form>
                        </div>-->
            <div class="topnav">
                <form action="home1" method="get">
                    <input type="text" placeholder="Search..." name="key"/>
                    <button onclick="this.form.submit()">
                        <img src="images/search_icon.png" width="16px" height="16px" alt="search"/>
                    </button>
                </form>
            </div>
            <div class="clr"></div>
            <div id="menu_tab">
                <c:set var="cat" value="${requestScope.data}"/>
                <c:set var="cid" value="${requestScope.cid}"/>
                <ul class="menu">
                    <li><a class="${cid==0?"active":""}" href="home1?cidd=${0}">ALL</a></li>
                        <c:forEach items="${cat}" var="c">
                        <li><a class="${c.id==cid?"active":""}" href="home1?cid=${c.id}">${c.name}</a></li>
                        </c:forEach>
                </ul>
            </div>
            <div class="clr"></div>
            <div id="content">
                <div id="tab1">
                    <c:set var="chid" value="${requestScope.chid}"/>
                    <h5 style="color: chocolate">TÊN HÃNG</h5>
                    <hr style="border-top: 1px solid chocolate"/>
                    <form id="f1" action="home1">
                        <input type="checkbox" id="c0" name="cidd"
                               ${chid[0]?"checked":""}
                               value="${0}" onclick="setCheck(this)"/>ALL<br/>

                        <c:forEach begin="0" end="${cat.size()-1}" var="i">
                            <input type="checkbox" id="cm" name="cidd"
                                   ${cat.get(i).getId()==cid?"checked":""}
                                   value="${cat.get(i).getId()}"
                                   ${chid[i+1]?"checked":""} onclick="setCheck(this)" />
                            ${cat.get(i).getName()}
                            <br/>
                        </c:forEach>

                    </form>
                    <h5 style="color: chocolate">MỨC GIÁ</h5>
                    <hr style="border-top: 1px solid chocolate"/>
                    <c:set var="pp" value="${requestScope.pp}"/>
                    <c:set var="pb" value="${requestScope.pb}"/>
                    <form id="f2" action="home1">
                        <input type="checkbox" id="g0" name="price"
                               ${pb[0]?"checked":""}
                               value="0" onclick="setCheck1(this)"/>ALL<br/>
                        <c:forEach begin="0" end="${4}" var="i">
                            <input type="checkbox" id="g1" name="price"
                                   ${pb[i+1]?"checked":""}
                                   value="${(i+1)}" onclick="setCheck1(this)"/>${pp[i]}<br/>
                        </c:forEach>
                    </form>
                </div>
                <div id="tab2">
                    <c:set var="news" value="${requestScope.news}"/>
                    <c:if test="${news!=null}">
                        <h4 style="color: chocolate">ĐIỆN THOẠI MỚI</h4>
                        <ul class="item">
                            <c:forEach items="${news}" var="p">
                                <li>
                                    <a href="#">
                                        <img src="${p.image}" width="80px" height="80px"/>
                                        <p>${p.name}</p>
                                        <p>Giá gốc: <span class="old">${(p.price * 1.5)}</span>$</p>
                                        <p>Sale:${(p.price)}$</p>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <hr/>
                    </c:if>
                    <c:set var="olds" value="${requestScope.olds}"/>
                    <c:if test="${news!=null}">
                        <h4 style="color: chocolate">ĐIỆN THOẠI KHUYẾN MẠI</h4>
                        <ul class="item">
                            <c:forEach items="${olds}" var="p">
                                <li>
                                    <a href="#">
                                        <img src="${p.image}" width="80px" height="80px"/>
                                        <p>${p.name}</p>
                                        <p>Giá gốc: <span class="old">${(p.price * 1.5)}</span>$</p>
                                        <p>Sale:${(p.price)}$</p>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <hr/>
                    </c:if> 
                    <c:set var="list" value="${requestScope.products}"/>
                    <c:if test="${list!=null}">
                        <h4 style="color: chocolate">ĐIỆN THOẠI (${list.size()}) SẢN PHẨM</h4>
                        <ul class="item">
                            <c:forEach items="${list}" var="p">
                                <li>
                                    <a href="buy1?service=add2cart&id=${p.id}">
                                        <img src="${p.image}" width="80px" height="80px"/>
                                        <p>${p.name}</p>
                                        <p>Giá gốc: <span class="old">${(p.price * 1.5)}</span>$</p>
                                        <p>Sale:${(p.price)}$</p>
                                        <input  type="button" value="Buy Product"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </div>
            </div>
                    <jsp:include page="footer.jsp" />
    </body>
</html>
