<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="models.Holiday" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Holidays</title>
    <style>

        
        h2 {
            margin-top: 20px;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 10px;
        }

        th {
            background-color: #333;
            color: #fff;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        #filterInput {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        #tableContainer {
            margin-top: 20px;
        }
        
        .checkbox-cell {
            text-align: center;
        }

        #submitBtn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div id="tableContainer">
        <input type="text" id="filterInput" placeholder="Search...">

     <form method="post" action="/submit">
            <table id="dataTable">
                <thead>
                    <tr>
                        <th>Year</th>
                        <th>Holiday Date</th>
                        <th>Holiday Title</th>
                        <th>Holiday Type</th>
                        <th>Select</th> <!-- Add a new column for checkboxes -->
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<Holiday> holidays = (List<Holiday>) request.getAttribute("holidays");
                    if (holidays != null) {
                        for (Holiday holiday : holidays) { %>
                            <tr>
                                <td><%= holiday.getYear() %></td>
                                <td><%= holiday.gethday_date() %></td>
                                <td><%= holiday.gethday_title() %></td>
                                <td><%= holiday.gethday_type() %></td>
                                <td class="checkbox-cell"><input type="checkbox" name="selectedHolidays" ></td>
                            </tr>
                        <% }
                    } %>
                </tbody>
            </table>

            <input type="submit" value="Submit" id="submitBtn">
        </form>
    </div>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#filterInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#dataTable tbody tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
</html>