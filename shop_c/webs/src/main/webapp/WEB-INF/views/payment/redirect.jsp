<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Redirecting...</title>
</head>
<body>
	<p>Redirecting to payment gateway... ${paymentUrl}</p>
</body>
<script>
    const paymentUrl = [[${paymentUrl}]];
    window.location.href = encodeURI(paymentUrl);
</script>
</html>
