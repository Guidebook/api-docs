# HTML Text

Guidebook allows HTML in a few specific fields (usually description fields).  HTML that is in html-supported fields will render as HTML in the mobile apps.  HTML tags in non html-supported fields will be rendered as plaintext.

### Allowed Tags

Tag Type       | Tags
---------      | --------
headings       | `h1`, `h2`, `h3`, `h4`, `h5`, `h6`, `h7`, `h8`
prose          | `a`, `p`, `div`, `blockquote`
formatted      | `pre`
inline         | `span`, `b`, `u`, `i`, `strong`, `em`, `tt`, `code`, `ins`, `del`, `sup`, `sub`, `kbd`, `samp`, `q`, `var`
lists          | `ol`, `ul`, `li`, `dl`, `dt`, `dd`
tables         | `table`, `thead`, `tbody`, `tfoot`, `tr`, `td`, `th`
breaks         | `br`, `hr`
other          | `ruby`, `rt`, `rp`


### Allowed Attributes

Tag       | Allowed Attributes for Tag
--------- | --------
`a`       | `href`
`img`     | `src`
`div`     | `itemscope`, `itemtype`
all tags  |  `abbr`, `accept`, `accept-charset`, `accesskey`, `action`, `align`, `alt`, `axis`, `border`, `cellpadding`, `cellspacing`, `char`, `charoff`, `charset`, `checked`, `cite`, `clear`, `cols`, `colspan`, `color`, `compact`, `coords`, `datetime`, `dir`, `disabled`, `enctype`, `for`, `frame`, `headers`, `height`, `hreflang`, `hspace`, `ismap`, `label`, `lang`, `longdesc`, `maxlength`, `media`, `method`, `multiple`, `name`, `nohref`, `noshade`, `nowrap`, `prompt`, `readonly`, `rel`, `rev`, `rows`, `rowspan`, `rules`, `scope`, `selected`, `shape`, `size`, `span`, `start`, `summary`, `tabindex`, `target`, `title`, `type`, `usemap`, `valign`, `value`, `vspace`, `width`, `itemprop`
