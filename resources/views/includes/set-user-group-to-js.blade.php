

@if(Auth::check() && isset(Auth::user()->group_id) && !is_null(Auth::user()->group_id))
<script>
    window.userInfo = window.userInfo || {};
    window.userInfo.groupId = {{ Auth::user()->group_id }};
</script>

@endif


