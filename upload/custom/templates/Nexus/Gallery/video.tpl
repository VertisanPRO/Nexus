{include file='header.tpl'}
{include file='navbar.tpl'}


<div class="container-fluid">

  <div class="row justify-content-center">

    <ul class="nav nav-pills mb-3">

      <li class="nav-item">
        <a class="nav-link{if !isset($SELECT_CATEGORY_ID)} active{/if}" id="cat" href="{$ALL_LINK}">{$SHOW_ALL}</a>
      </li>
      {foreach from=$CATEGORY_LIST item=category}
      <li class="nav-item">
        <a class="nav-link{if $SELECT_CATEGORY_ID === $category.id} active{/if}" id="cat{$category.id}" href="{$category.link}">{$category.name}</a>
      </li>
      {/foreach}



    </ul>
  </div>
</div>


<div class="container">
  <!-- Grid row -->
  <div class="row">



    <!-- FOR -->
    {foreach from=$VIDEO_LIST item=video}


    <!-- Grid column -->
    <div class="col-lg-4 col-md-12 mb-4">

      <!--Modal: Name-->
      <div class="modal fade" id="modal{$video.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">

          <!--Content-->
          <div class="modal-content">

            <!--Body-->
            <div class="modal-body mb-0 p-0">

              <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
                <iframe class="embed-responsive-item" src="https://youtube.com/embed/{$video.code}"
                allowfullscreen></iframe>
              </div>

            </div>

            <!--Footer-->
            <div class="modal-footer justify-content-center">
              
              <div class="caption text-center">{$video.description}</div>
              
            </div>
            <div class="text-center">
            <button style="margin: 8px;" type="button" class="btn btn-primary btn-sm" data-dismiss="modal">{$CLOSE}</button>
            </div>
          </div>
          <!--/.Content-->

        </div>
      </div>
      <!--Modal: Name-->
      
      <a>
        <div class="text-center"><h5>{$video.name}</h5></div>
        <img class="rounded mx-auto d-block" src="http://img.youtube.com/vi/{$video.code}/mqdefault.jpg" alt="video" data-toggle="modal" data-target="#modal{$video.id}">
      </a>
    </div>
    <!-- Grid column -->

    {/foreach}
    <!-- /FOR -->



  </div>
  <!-- Grid row -->
  {$PAGINATION}

</div>


{include file='footer.tpl'}