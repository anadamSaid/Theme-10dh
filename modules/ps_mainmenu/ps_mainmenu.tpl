{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
        {if $depth <=2}
          <ul class="top-menu {if $depth == 1}top-menu-one{/if} {if $depth == 2}top-menu-tow{/if}" {if $depth == 0}id="top-menu"{/if}  data-depth="{$depth}">
            {if $depth == 1}<button class="marbtns arrowleft arrow" type="button">Previous</button><div class="top-menu-dv"> {/if}
            {foreach from=$nodes item=node}
                <li class="{$node.type}{if $node.current} current {/if}  {if $depth == 1} cdepth1 {/if}" id="{$node.page_identifier}">
                {assign var=_counter value=$_counter+1}
                  <a
                    class="{if $depth >= 0}dropdown-item{/if}{if $depth === 1 } dropdown-submenu {/if} {if $depth === 2} scdptow{/if}"
                    href="{$node.url}" data-depth="{$depth}"
                    {if $node.open_in_new_window} target="_blank" {/if}
                  >
                  {if $depth === 1}
                      {if $node.image_urls}
                        <img src="{$node.image_urls|reset}" />
                      {else}
                        <div class="scdpdefult"></div>
                      {/if}
                  <div class="subcatdepth1">{$node.label}</div> 
                  {else}
                    {$node.label} 
                  {/if}
                    {if $node.children|count}
                      {* Cannot use page identifier as we can have the same page several times *}
                      {assign var=_expand_id value=10|mt_rand:100000}
                      {if $depth <2}
                        <span class="float-xs-right hidden-md-up">
                          <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse" class="navbar-toggler collapse-icons collapse-btn">
                            <i class="material-icons-outlined add">add</i>
                            <i class="material-icons-outlined remove">remove</i>
                          </span>
                          {* <button type="button" class="btn btn-square-small drawer-close-button js-drawer-close" aria-label="Close menu" title="Close menu">
                            <span class="material-icons-outlined" aria-hidden="true">close</span>
                          </button> *}
                        </span>
                      {/if}
                    {/if}
                  </a>
                  {if $node.children|count}
                  <div {if $depth === 0} class="popover sub-menu js-sub-menu collapse"{else} class="collapse"{/if} id="top_sub_menu_{$_expand_id}">
                    {menu nodes=$node.children depth=$node.depth parent=$node}
                  </div>
                  {/if}
                </li>
            {/foreach}
            {if $depth == 1}</div><button class="marbtns arrowright arrow" type="button">Next</button>{/if}
          </ul>
        {/if}
  {/if}
{/function}

<div class="menu js-top-menu position-static hidden-sm-down" id="_desktop_top_menu">
    {menu nodes=$menu.children}
   <div class="drawer-signin">
    <div class="user-info">
      {* {hook h='displaydrawerlogin'} *}
    </div>
    <div id="vcontact-info">
      {if !empty(Configuration::get('PS_SHOP_EMAIL'))}
        <a href="mailto:{{Configuration::get('PS_SHOP_EMAIL')}}" target="_blank" rel="noreferrer noopener"><p><span class="material-icons-outlined" aria-hidden="true">email</span>{Configuration::get('PS_SHOP_EMAIL')}</p></a>
      {/if}
      {if !empty(Configuration::get('PS_SHOP_PHONE'))}
        <a href="tel:{{Configuration::get('PS_SHOP_PHONE')}}" target="_blank" rel="noreferrer noopener"><p><span class="material-icons-outlined" aria-hidden="true">phone</span>{Configuration::get('PS_SHOP_PHONE')}</p></a>
      {/if}
    </div>
   </div>
    <div class="clearfix"></div>
</div>
