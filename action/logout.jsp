<% 
    session.invalidate();
%>

<script>
    self.close();
    opener.window.location.reload()
</script>