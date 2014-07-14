{block name='frontend_checkout_premium_body'}

    {if $sPremiums|@count}
        <div class="premium-product panel has--border">

            {* Headline *}
            {block name='frontend_checkout_cart_premium_headline'}
                <div class="premium-product--title panel--title is--underline">
                    {s name="CartPremiumsHeadline" namespace="frontend/checkout/cart"}{/s}
                </div>
            {/block}

            {* Product slider *}
            {block name='frontend_checkout_premium_slider'}
                <div class="premium-product--content panel--body product-slider" data-mode="local">

                    {* Product slider container *}
                    {block name='frontend_checkout_premium_slider_container'}
                        <div class="product-slider--container">
                            {foreach $sPremiums as $premium}

                                {* Product slider item *}
                                {block name='frontend_checkout_premium_slider_item'}
                                    <div class="premium-product--product product-slider--item">

                                        <div class="product--inner">
                                            {if $premium.available}
                                                {block name='frontend_checkout_premium_info_button'}
                                                    <p class="premium-product--free">{s name="PremiumInfoFreeProduct"}{/s}</p>
                                                {/block}
                                            {else}
                                                {block name='frontend_checkout_premium_info_difference'}
                                                    <p class="premium-product--info">{s name="PremiumsInfoAtAmount"}{/s} {$premium.startprice|currency} {s name="PremiumInfoBasketValue"}{/s}</p>
                                                {/block}
                                            {/if}

                                            {* Product image *}
                                            {block name='frontend_checkout_premium_image'}
                                                <a href="{$premium.sArticle.linkDetails}" title="{$premium.sArticle.articleName}" class="product--image">
                                                    {if $premium.available}
                                                        <div class="premium-product--badge">
                                                            <i class="icon--check"></i>
                                                        </div>
                                                    {/if}

                                                    {if $premium.sArticle.image.src}
                                                        <img src="{$premium.sArticle.image.src.3}" alt="{$premium.sArticle.articleName}"
                                                             title="{$premium.sArticle.articleName}">
                                                    {else}
                                                        <img src="{link file='frontend/_resources/images/no_picture.jpg'}"
                                                             alt="{s name="PremiumInfoNoPicture"}{/s}">
                                                    {/if}
                                                </a>
                                            {/block}

                                            {if $premium.available}
                                                {block name='frontend_checkout_premium_form'}
                                                    <form action="{url action='addPremium' sTargetAction=$sTargetAction}" method="post" id="sAddPremiumForm{$key}" name="sAddPremiumForm{$key}">
                                                        {block name='frontend_checkout_premium_select_article'}
                                                            {if $premium.sVariants && $premium.sVariants|@count > 1}
                                                                <select class="premium--selection" id="sAddPremium{$key}" name="sAddPremium">
                                                                    <option value="">{s name="PremiumInfoSelect"}{/s}</option>
                                                                    {foreach from=$premium.sVariants item=variant}
                                                                        <option value="{$variant.ordernumber}">{$variant.additionaltext}</option>
                                                                    {/foreach}
                                                                </select>
                                                            {else}
                                                                <input type="hidden" name="sAddPremium" value="{$premium.sArticle.ordernumber}"/>
                                                            {/if}
                                                        {/block}

                                                        {block name='frontend_checkout_premium_info_button'}
                                                            <button class="btn btn--primary is--align-center" type="submit">
                                                                {s name='PremiumActionAdd'}{/s}
                                                                <i class="icon--arrow-right"></i>
                                                            </button>
                                                        {/block}
                                                    </form>
                                                {/block}
                                            {else}
                                                <div class="premium-product--difference is--align-center">
                                                    {s name="PremiumsInfoDifference"}{/s} <span class="difference--price">{$premium.sDifference|currency}</span>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                {/block}
                            {/foreach}
                        </div>
                    {/block}
                </div>
            {/block}
        </div>
    {/if}
{/block}