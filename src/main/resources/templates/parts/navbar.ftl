<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark bg-gradient-dark border-bottom border-warning">
    <a class="navbar-brand text-warning" href="/">Sweater</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Messages</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">User list</a>
            </li>
            </#if>
            <#if user??>
            <li class="nav-item">
                 <a class="nav-link" href="/user/profile">Profile</a>
             </li>
            </#if>
        </ul>
        <#if name == "unknown">
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-outline-info" type="submit">Sign In</button>
            </form>
        <#else>
        <div class="navbar-text mr-3 text-danger">${name}</div>
        <@l.logout />
        </#if>
    </div>
</nav>
