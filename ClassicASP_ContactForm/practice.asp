
<!DOCTYPE html>
<html>
<body>

<% response.write "Hello World" %>
<br><br>
<%
days=Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
response.write(Join(days) & "<br />")
response.write(Join(days,",") & "<br />")
response.write(Join(days," ### "))

%>
<br><br><br>
<%
Dim famname(5),i
famname(0) = "Jan Egil"
famname(1) = "Tove"
famname(2) = "Hege"
famname(3) = "Stale"
famname(4) = "Kai Jim"
famname(5) = "Borge"

For i = 0 to 5
     response.write(famname(i) & "<br>")
Next
%>

<br><br><br>

<%
dim h
h=hour(now())

response.write("<p>" & now())
response.write("</p>")
If h<12 then
   response.write("Good Morning!")
else
   response.write("Good day!")
end if
%>

<br><br><br>
<%

a=Array(5,10,15,20)
response.write(a(3))

%>

<br><br><br>
<%

b=Array("Sandra","Wilmar",15,20)
response.write(b(1))

%>

<br><br><br>
<%

a=Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
b=Filter(a,"S")
for each x in b
    response.write(x & "<br />")
next

%>
<br><br><br>
<%

days=Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
response.write(LBound(days) & "<br />")
response.write(UBound(days) & "<br />")

%>
<br><br><br>

<%

Dim food(2,3)
food(0,0)="Apple"
food(0,1)="Banana"
food(0,2)="Orange"
food(0,3)="Lemon"
food(1,0)="Pizza"
food(1,1)="Hamburger"
food(1,2)="Spaghetti"
food(1,3)="Meatloaf"
food(2,0)="Cake"
food(2,1)="Cookie"
food(2,2)="Icecream"
food(2,3)="Chocolate"
response.write(LBound(food,1) & "<br />")
response.write(UBound(food,1) & "<br />")
response.write(LBound(food,2) & "<br />")
response.write(UBound(food,2) & "<br />")

%>
</body>
</html>