<#import "parts/common.ftl" as c>

<@c.page>
<h5 class="text-warning">${username}</h5>
${message?ifExists}
<form method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label text-warning">Password:</label>
        <div class="col-sm-10">
            <input type="password" name="password" class="form-control text-warning border border-warning bg-transparent" placeholder="Password" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label text-warning">Email:</label>
        <div class="col-sm-10">
            <input type="email" name="email" class="form-control text-warning border border-warning bg-transparent" placeholder="some@some.com" value="${email!''}" />
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-outline-warning col-sm-12" type="submit">Save</button>
</form>
</@c.page>