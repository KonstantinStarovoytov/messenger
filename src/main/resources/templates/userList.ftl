<#import "parts/common.ftl" as c>

<@c.page>

<h6 class="text-warning">List of users</h6>

<table class="table table table-sm text-warning">
    <thead>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Role</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
            <td><a href="/user/${user.id}" class="btn btn-secondary btn-sm btn-outline-info col-sm-12">Edit</a></td>
        </tr>
    </#list>
    </tbody>
</table>
</@c.page>
