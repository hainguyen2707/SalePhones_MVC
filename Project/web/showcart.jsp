<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.ProductCart"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            body {
                font-family: Arial, sans-serif;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            caption {
                font-size: 1.2em;
                font-weight: bold;
                margin-bottom: 10px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            .remove-button {
                background-color: #ff6666;
                color: white;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
            }
            a{
                text-decoration: none;
                color: chocolate;
                font-size: 22px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <table border="1">
            <caption>List of products</caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total price</th>
                <th>Remove</th>
            </tr>
            <%
                double grandTotal = 0;
                java.util.Enumeration em = session.getAttributeNames();

                while (em.hasMoreElements()) {
                    String key = em.nextElement().toString(); // get key
                    Object obj = session.getAttribute(key);

                    if (obj instanceof ProductCart) {
                        ProductCart productCart = (ProductCart) obj;
            %>
            <tr>
                <td><%=productCart.getId()%></td>
                <td><%=productCart.getName()%></td>
                <td>
                    <form  action="UpdateQuantityServlet"  method="post">
                        <input type="hidden" name="productId" value="<%=key%>">
                        <input type="number" name="quantity" value="<%=productCart.getQuantity()%>" min="1" required>
                        <button type="submit">Update</button>
                    </form>
                </td>
                <td><%=productCart.getPrice()%></td>
                <td><%=productCart.getQuantity() * productCart.getPrice()%></td>
                <td>
                    <form action="RemoveProductServlet" method="post" onsubmit="return removeProduct('<%=key%>')">
                        <input type="hidden" name="productId" value="<%=key%>">
                        <button type="submit" class="remove-button">Remove</button>
                    </form>
                </td>
            </tr>
            <%
           grandTotal += productCart.getQuantity() * productCart.getPrice();
               }
           }
            %>
        </table>
        <hr/>
        <p>Grand Total: <%= grandTotal %></p>

        <form action="CheckOutServlet" method="post">
            <input type="hidden" name="grandTotal" value="<%= grandTotal %>">
            <!-- ... Other form fields ... -->
            <input type="submit" value="Check out"/>
        </form>
        <hr/>
<!--    <c:if test="${not empty errorMessage}">
        <div style="background-color: #ffcccc; color: #cc0000; padding: 10px; border: 1px solid #cc0000;">
            <strong>Error:</strong> ${errorMessage}
        </div>
    </c:if>-->
    <a href="home">Click me to continue shopping</a>
    <script type="text/javascript">
        function removeProduct(productId) {
            // Add JavaScript or AJAX code here to handle the removal of the product
            alert('Product removed: ' + productId);
        }
    </script>
</body>
</html>
