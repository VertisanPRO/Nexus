{include file='header.tpl'}
{include file='navbar.tpl'}


<div class="container">

  <div id="carouselCaptions" class="carousel slide" data-ride="carousel">

    <!-- Indicators -->

    {if $INDICATORS === 1}
    <ol class="carousel-indicators">
      {$i = 1}
      {foreach from=$CAROUSEL_LIST item=carousel}
      <li data-target="#carouselCaptions" data-slide-to="{$carousel.id}"{if $i === 1} class="active"{/if}></li>
      {$i = 0}
      {/foreach}
    </ol>
    {/if}

    <!-- Carousel -->
    <div class="carousel-inner main-img carousel-fix">
      {$i = 1}
      {foreach from=$CAROUSEL_LIST item=carousel}
      <div class="carousel-item carousel-fix{if $i === 1} active{/if}">
        <img src="{$carousel.src}" class="d-block w-100" alt="{$carousel.alt}">
        <div class="carousel-caption d-none d-md-block">
          <h5 class="{$carousel.carousel_head_class}">{$carousel.carousel_head}</h5>
          <p class="{$carousel.carousel_title_class}">{$carousel.carousel_title}</p>
        </div>
      </div>
      {$i = 0}
      {/foreach}
    </div>

    <a class="carousel-control-prev" href="#carouselCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

</div>
<hr>


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
  <div class="row">

    {foreach from=$IMAGES_LIST item=image}
    <div class="col-lg-3 col-md-4 col-xs-6 thumb">
      <a class="thumbnail bg-gallery-thumbnail bg-border {$HOVER_ANIMATION}" style="background-image: url({$image.small_src});" href="#" data-image-id="" data-toggle="modal" data-title=""
      data-image="{$image.src}"
      data-target="#image-gallery">
      <img class="img-thumbnail bg-gallery-img-thumbnail" src="https://svgshare.com/i/Q9N.svg" alt="{$image.alt}"></a>

    </div>
    {/foreach}

  </div>

  {$PAGINATION}


  <div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="image-gallery-title"></h4>
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span>
          </button>
        </div>
        <div class="modal-body">
          <img id="image-gallery-image" class="img-responsive col-md-12" src="">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary float-left" id="show-previous-image"><i class="fa fa-arrow-left"></i>
          </button>

          <button type="button" id="show-next-image" class="btn btn-secondary float-right"><i class="fa fa-arrow-right"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
</div>


{include file='footer.tpl'}