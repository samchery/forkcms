{*
	variables that are available:
	- {$blogCategory}: contains data about the category
	- {$blogArticles}: contains an array with all posts, each element contains data about the post
*}

<div id="blog" class="archive">
	<h2>
		{option:blogArchive['month']}{$blogArchive['start_date']|date:'F Y':{$LANGUAGE}}{/option:blogArchive['month']}
		{option:!blogArchive['month']}{$blogArchive['start_date']|date:'Y':{$LANGUAGE}}{/option:!blogArchive['month']}
	</h2>

	{option:blogArticles}
		<table class="datagrid" width="100%">
			<thead>
				<tr>
					<th width="15%">{$lblDate|ucfirst}</th>
					<th width="65%">{$lblTitle|ucfirst}</th>
					<th width="20%">{$lblComments|ucfirst}</th>
				</tr>
			</thead>
			<tbody>
				{iteration:blogArticles}
					<tr>
						<td class="date">{$blogArticles.publish_on|date:{$dateFormatShort}:{$LANGUAGE}}</td>
						<td class="title"><a href="{$blogArticles.full_url}" title="{$blogArticles.title}">{$blogArticles.title}</a></td>
						<td class="comments">
						<!-- Comments -->
							{option:!blogArticles.comments}<a href="{$blogArticles.full_url}#{$actComment}">{$msgBlogNoComments|ucfirst}</a>{/option:!blogArticles.comments}
							{option:blogArticles.comments}
								{option:blogArticles.comments_multiple}<a href="{$blogArticles.full_url}#{$actComments}">{$msgBlogNumberOfComments|sprintf:{$blogArticles.comments_count}}</a>{/option:blogArticles.comments_multiple}
								{option:!blogArticles.comments_multiple}<a href="{$blogArticles.full_url}#{$actComments}">{$msgBlogOneComment}</a>{/option:!blogArticles.comments_multiple}
							{/option:blogArticles.comments}
						</td>
					</tr>
				{/iteration:blogArticles}
			</tbody>
		</table>
		{include:file='{$FRONTEND_CORE_PATH}/layout/templates/pagination.tpl'}
	{/option:blogArticles}
</div>