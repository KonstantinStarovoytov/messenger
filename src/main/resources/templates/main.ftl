<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control text-warning border border-warning bg-transparent" value="${filter?ifExists}" placeholder="Search by tag">
            <button type="submit" class="btn btn-outline-warning ml-2">Search</button>
        </form>
    </div>
</div>

<a class="btn btn-outline-warning" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Message
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')} text-warning border border-warning bg-transparent"
                       value="<#if message??>${message.text}</#if>" name="text" placeholder="Message" />
                <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control text-warning border border-warning bg-transparent"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Tags">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group bg-transparent">
                <div class="custom-file bg-transparent">
                    <input type="file" name="file" id="customFile" class="bg-transparent" disable="true">
                    <label class="custom-file-label text-warning border border-warning bg-dark" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-outline-warning">Post message</button>
            </div>
        </form>
    </div>
</div>

<div class="card-columns">
    <#list messages as message>
    <div class="card my-3 bg-transparent border-dark">
        <#if message.filename??>
        <a href="#${message.id}-modal-id" data-toggle="modal">
        <img src="/img/${message.filename}" class="card-img-top">
        </a>
        <div class="modal fade" id="${message.id}-modal-id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <img src="/img/${message.filename}" class="img-fluid">
            </div>
          </div>
        </div>
        </#if>
        <div class="m-2">
            <span class="text-light">${message.text}</span>
            <i class="text-white-50"><#if message.tag??>#</#if>${message.tag}</i>
        </div>
        <div class="card-footer text-muted bg-dark">
            ${message.authorName}
        </div>
    </div>
    <#else>
    No message
    </#list>
</div>
</@c.page>