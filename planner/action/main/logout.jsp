<% 
    session.invalidate();
%>

<script>
    opener.window.location.reload()
    opener.location.href="/planner/index.jsp"
    self.close();
</script>