<%-- 
    Document   : error_404
    Created on : Oct 24, 2021, 7:45:59 PM
    Author     : Gia Minh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>500 Error Page In Boarding House UTE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css?family=Sniglet:400,800');

        body{
            background: #f0f2f2;
            font-family: 'Sniglet', cursive;

        }
        h1{
            text-align: center;
            font-size: 190px;
            font-weight: 400;
            margin: 0;
        }
        .fa{
            font-size: 120px;
            text-align: center;
            display: block;
            padding-top: 100px;
            margin: 0 auto;
            color: #A93226;
        }
        #error p{
            text-align: center;
            font-size: 36px;
            color: #4A235A;
        }
        a.back{
            text-align: center;
            margin: 0 auto;
            display: block;
            text-decoration: none;
            font-size: 24px;
            background: #BA4A00;
            border-radius: 10px;
            width: 10%;
            padding: 4px;
            color: #fff; 

        }
        footer p{
            padding-top: 160px;
            text-align: center;
        }
        a.w3hubs{
            text-decoration: none;
            color: #A93226;
        }
        @media(max-width: 550px){
            a.back{
                width: 20%;
            }
        }
        @media(max-width: 425px){
            h1{
                padding-top: 20px;
            }
            .fa{
                padding-top: 100px;
            }
        }
    </style>
<body>
    <section id="error">
        <div class="content">
            <i class="fa fa-warning"></i>
            <h1>500</h1>
            <p>Opps! Internal Server Error!</p>
            <p>Click Back to home and try again!!!</p>
            <a class="back" href="<c:url value='../index.jsp' />">Back to home</a>
        </div>
    </section>
</body>
</head>
