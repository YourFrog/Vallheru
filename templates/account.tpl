{$Welcome}
<table align="center" width="90%">
{foreach $Menus as $Category}
    {if $Category@iteration is not div by 2}
        <tr>
    {/if}
        <td valign="top"><b>{$Category@key}</b>
        <ul>
        {foreach $Category as $Menu}
            <li><a href="account.php?view={$Menu@key}">{$Menu}</a></li>
	{/foreach}
	</ul>
    </td>
    {if $Category@iteration is div by 2}
        </tr>
    {/if}
{/foreach}
</table>

{if $View == "links"}
    {$Linksinfo}<br />
    {if $Linksid[0] != ""}
        <table align="center">
            <tr>
                <td align="center"><b>{$Tfile}</b></td>
                <td align="center"><b>{$Tname}</b></td>
		<td align="center"><b>{$Tnumber}</b></td>
                <td><b>{$Tactions}</b><td>
            </tr>
            {section name=links loop=$Linksid}
                <tr>
                    <td>{$Linksfile[links]}</td>
                    <td>{$Linkstext[links]}</td>
		    <td>{$Linksnumber[links]}</td>
                    <td>
                        <a href="account.php?view=links&amp;step=edit&amp;lid={$Linksid[links]}">{$Aedit}</a><br />
                        <a href="account.php?view=links&amp;step=delete&amp;lid={$Linksid[links]}">{$Adelete}</a>
                    </td>
                </tr>
            {/section}
        </table>
    {/if}<br /><br />
    <form method="post" action="account.php?view=links&amp;step=edit&amp;lid={$Linkid}&amp;action=change">
        {$Tfile}: <input type="text" name="linkadress" size="20" value="{$Linkfile}" /><br />
        {$Tname}: <input type="text" name="linkname" size="20" value="{$Linkname}" /><br />
	{$Tnumber}: <input type="text" name="linknumber" size="20" value="{$Linknumber}" /><br />
        <input type="submit" value="{$Aform}" />
    </form>
{/if}

{if $View == "bugtrack"}
    {$Bugtrackinfo}<br /><br />
    <table align="center">
        <tr>
            <td><b>{$Bugid}</b></td>
            <td><b>{$Bugtype}</b></td>
            <td><b>{$Bugloc}</b></td>
            <td><b>{$Bugname}</b></td>
        </tr>
        {section name=bugtrack loop=$Bugsid}
            <tr>
                <td align="center">{$Bugsid[bugtrack]}</td>
                <td align="center">{$Bugstype[bugtrack]}</td>
                <td align="center">{$Bugsloc[bugtrack]}</td>
                <td align="center">{$Bugsname[bugtrack]}</td>
            </tr>
        {/section}
    </table>
{/if}

{if $View == "bugreport"}
    {$Buginfo}<br /><br />
    <form method="post" action="account.php?view=bugreport&amp;step=report">
        {$Bugname}: <input type="text" name="bugtitle" size="40" /><br /><br />
        {$Bugtype}: <select name="type">
            <option value="text">{$Bugtext}</option>
            <option value="code">{$Bugcode}</option>
        </select><br /><br />
        {$Bugloc}: <input type="text" name="location" size="40" value="{$Loc}" /><br /><br />
        {$Bugdesc}: <textarea name="desc" rows="13" cols="50"></textarea><br /><br />
        <input type="submit" value="{$Areport}" />
    </form>
{/if}

{if $View == "changes"}
    {$Changesinfo}<br />
    <ul>
        {section name=changes loop=$Changedate}
        <li>{$Changedate[changes]} {$Changeauthor[changes]}<br />
            {$Changeloc}: {$Changelocation[changes]}<br />
            {$Changetext[changes]}<br /><br />
        </li>
        {/section}
    </ul><br /><br />
    {if $Tpages > 1}
    	<br />{$Fpage}
    	{for $page = 1 to $Tpages}
	    {if $page == $Tpage}
	        {$page}
	    {else}
                <a href="account.php?view=changes&page={$page}">{$page}</a>
	    {/if}
    	{/for}
    {/if}
{/if}

{if $View == "options"}
    {$Toptions}<br /><br />
    <form method="post" action="account.php?view=options&amp;step=options">
        <input type="checkbox" name="battlelog" {$Checked} /> {$Tbattlelog}<br />
	<input type="radio" name="battle" value="A" {$Checked4} /> {$Tonlyattack}<br />
	<input type="radio" name="battle" value="D" {$Checked5} /> {$Tonlyattacked}<br />
	<input type="radio" name="battle" value="Y" {$Checked3} /> {$Talways}<br /><br />
        <input type="checkbox" name="graphbar" {$Checked2} /> {$Tgraphbar}<br />
	<input type="checkbox" name="rinvites" {$Checked10} /> {$Trinvites}<br /><br />
	<input type="checkbox" name="autodrink" {$Checked6} /> {$Tautodrink}<br />
	<input type="radio" name="drink" value="H" {$Checked7} /> {$Tautoheal}<br />
	<input type="radio" name="drink" value="M" {$Checked8} /> {$Tautomana}<br />
	<input type="radio" name="drink" value="A" {$Checked9} /> {$Tautoall}<br />
        <input type="submit" value="{$Anext}" />
    </form>
    {if $Step == "options"}
        {$Message}
    {/if}
{/if}

{if $View == "freeze"}
    {$Freezeinfo}
    <form method="post" action="account.php?view=freeze&amp;step=freeze">
        {$Howmany}: <input type="tezt" name="amount" size="5" /><br />
        <input type="submit" value="{$Afreeze2}" />
    </form>
    {if $Step == "freeze"}
        {$Message}
    {/if}
{/if}

{if $View == "immu"}
    {$Immuinfo}?<br />
    - <a href="account.php?view=immu&amp;step=yes">{$Yes}</a><br />
    - <a href="account.php">{$No}</a><br />
    {if $Step == "yes"}
        {$Immuselect} <a href="account.php">{$Here}</a> {$Immuselect2}.
    {/if}
{/if}

{if $View == "reset"}
    {$Resetinfo}<br />
    <form method="post" action="account.php?view=reset&amp;step=make">
        <input type="radio" name="reset" value="A" checked />{$Allreset}<br />
	<input type="radio" name="reset" value="P" />{$Partreset}<br />
        <input type="submit" value="{$Areset}" />
    </form>
    {if $Step == "make"}
        {$Resetselect}<br />
    {/if}
{/if}

{if $View == "avatar"}
    {$Avatarinfo}<br />
    {if $Avatar != ""}
    <center><br /><br /><img src="{$Avatar}" width="200" heigth="200">
      <form action="account.php?view=avatar&amp;step=usun" method="post">
    <input type="hidden" name="av" value="{$Value}" />
    <input type="submit" value="{$Delete}" /></form></center>
    {/if}
    <form enctype="multipart/form-data" action="account.php?view=avatar&amp;step=dodaj" method="post">
    <input type="hidden" name="MAX_FILE_SIZE" value="30720" />
    {$Afilename}: <input name="plik" type="file" /><br />
    <input type="submit" value="{$Aselect}" /></form>
{/if}

{if $View == "name"}
    <form method="post" action="account.php?view=name&amp;step=name">
    <input type="submit" value="{$Change}" /> {$Myname} <input type="text" name="name" />
    </form>
{/if}

{if $View == "pass"}
    {$Passinfo}<br />
    <form method="post" action="account.php?view=pass&amp;step=cp">
    <table>
    <tr><td>{$Oldpass}:</td><td><input type="password" name="cp" /></td></tr>
    <tr><td>{$Newpass}:</td><td><input type="password" name="np" /></td></tr>
    <tr><td colspan=2 align=center><input type="submit" value="{$Change}" /></td></tr>
    </table>
    </form>
{/if}

{if $View == "profile"}
    <form method="post" action="account.php?view=profile&amp;step=profile">
    <table>
    <tr><td>{$Profileinfo}</td></tr>
    <tr><td align="center">{$Newprofile}:<br /> <textarea name="profile" id="profile" rows="15" cols="40">{$Profile2}</textarea></td></tr>
    <tr><td colspan="2" align="center"><input type="submit" value="{$Change}" /></td></tr>
    </table>
    </form>
    {if $Step == "profile"}
    <table>
    <tr><td>{$Newprofile2}:</td><td></td></tr>
    <tr><td>{$Profile}</td><tr>
    </table>
    {/if}
{/if}

{if $View == "eci"}
    <form method="post" action="account.php?view=eci&amp;step=ce">
    <table>
    <tr><td>{$Oldemail}:</td><td><input type="text" name="ce" /></td></tr>
    <tr><td>{$Newemail}:</td><td><input type="text" name="ne" /></td></tr>
    <tr><td colspan="2" align="center"><input type="submit" value="{$Change}" /></td></tr>
    </table>
    </form>
    <form method="post" action="account.php?view=eci&amp;step=gg">
    <table>
    <tr><td>{$Tcommunicator}:</td><td><select name="communicator">
        {section name=acccom loop=$Tcom}
            <option value="{$Comm[acccom]}">{$Tcom[acccom]}</option>
        {/section}
    </select></td></tr>
    <tr><td>{$Newgg}:</td><td><input type="text" name="gg" /></td></tr>
    <tr><td colspan="2" align="center"><input type="submit" value="{$Change}" /></td></tr>
   </table>
   </form>
{/if}

{if $View == "style"}
    <form method="post" action="account.php?view=style&amp;step=style">
    <table>
    <tr>
    <td><input type="submit" value="{$Sselect}" /> {$Textstyle}:</td>
    </tr>
    <tr>
    <td><select name="newstyle">
    {section name=account loop=$Stylename}
        <option value="{$Stylename[account]}">{$Stylename[account]}</option>
    {/section}
    </select>
    </table></form>
    <br /><br />
    {$Graphstyle2}<br />
    <form method="post" action="account.php?view=style&amp;step=graph">
    <table>
    <tr>
    <td><input type="submit" value="{$Sselect}" /> {$Graphstyle}:</td>
    </tr>
    <tr>
    <td><select name="graphserver">
    {section name=account1 loop=$Layoutname}
        <option value="{$Layoutname[account1]}">{$Layoutname[account1]}</option>
    {/section}
    </select>
    </table></form>
    <br /><br />
    {if $Step == "style" || $Step == "graph"}
       {$Youchange}. (<a href="account.php">{$Refresh}</a>)
    {/if}
{/if}

{if $View == "vallars"}
    {$Info}<br />
    <ul>
        {section name=vallars loop=$Date}
        <li>{$Date[vallars]} <br />
	    {$Tgranted}: <b><a href="view.php?view={$Ownerid[vallars]}">{$Owner[vallars]}</a></b> {$Id}:{$Ownerid[vallars]}<br />
            {$Tamount}: {$Amount[vallars]}<br />
            {$Treason}: {$Reason[vallars]}<br /><br />
        </li>
        {/section}
    </ul><br /><br />
    {if $Tpages > 1}
    	<br />{$Fpage}
    	{for $page = 1 to $Tpages}
	    {if $page == $Tpage}
	        {$page}
	    {else}
                <a href="account.php?view=vallars&page={$page}">{$page}</a>
	    {/if}
    	{/for}
    {/if}
{/if}

{if $View == "forums"}
    {$Info}<br />
    <form method="post" action="account.php?view=forums&amp;step=set">
    <input type="radio" name="forums" value="All" {$Achecked} /> {$Oall}<br />
    <input type="radio" name="forums" value="Selected" {$Schecked} /> {$Oselected}<br />
    {section name=forums loop=$Name}
        <input type="checkbox" name="{$Id[forums]}" {$Checked[forums]} /> {$Name[forums]}<br />
    {/section}
    <input type="submit" value="{$Aset}" />
    </form>
{/if}

{if $View == "roleplay"}
    {$Info}<br /><br />
    <form method="post" action="account.php?view=roleplay&amp;step=set">
    {$Rprofileinfo}<br />
    <textarea name="roleplay" id="roleplay" rows="15" cols="40">{$Rprofile}</textarea><br /><br />
    {$Oocinfo}<br />
    <textarea name="ooc" id="ooc" rows="15" cols="40">{$Ooc}</textarea><br /><br />
    {$Shortrpinfo}<br />
    <input type="text" name="shortrp" size="40" value="{$Shortrp}" /><br /><br />
    <input type="submit" value="{$Aset}" />
    </form>
{/if}

{if $View == "ignored"}
    {$Info}<br /><br />
    <form method="post" action="account.php?view=ignored&amp;add">
        <input type="submit" value="{$Aadd}" /> {$Tadd} <input type="text" name="pid" size="5" /> {$Tadd2}
    </form><br />
    {$Message}<br />
    {if $Iamount > 0}
        <table width="90%" align="center">
	    <tr>
	        <th>{$Tplayer}</th>
		<th>{$Tmail}</th>
		<th>{$Tinn}</th>
	        <th>{$Toptions}</th>
	    </tr>
	    {section name=ilist loop=$Ignored}
	        <tr>
		    <form method="post" action="account.php?view=ignored&amp;edit={$Ignored[ilist].id}">
	    	    <td><a href="view.php?view={$Ignored[ilist].pid}">{$Ignored[ilist].user} ({$Tid}: {$Ignored[ilist].pid})</a></td>
		    <td><input type="checkbox" {$Ignored[ilist].mail} name="mail{$Ignored[ilist].pid}" /></td>
		    <td><input type="checkbox" {$Ignored[ilist].inn} name="inn{$Ignored[ilist].pid}" /></td>
		    <td><a href="account.php?view=ignored&amp;edit={$Ignored[ilist].id}&amp;delete">{$Adelete}</a><br />
		        <input type="submit" value="{$Aedit}" />
		    </td>
		    </form>
		</tr>
	    {/section}
    	</table>
    {else}
        {$Noignored}
    {/if}
{/if}

{if $View == "contacts"}
    {$Info}<br /><br />
    <form method="post" action="account.php?view=contacts&amp;add">
        <input type="submit" value="{$Aadd}" /> {$Tadd} <input type="text" name="pid" size="5" /> {$Tadd2}
    </form><br />
    {$Message}<br />
    {if $Camount > 0}
        <table width="90%" align="center">
	    <tr>
	        <th>{$Tplayer}</th>
		<th></th>
	        <th>{$Toptions}</th>
	    </tr>
	    {section name=clist loop=$Contacts}
	        <tr>
	    	    <td><a href="view.php?view={$Contacts[clist].pid}">{$Contacts[clist].user} ({$Tid}: {$Contacts[clist].pid})</a></td>
		    <td><a href="mail.php?view=write&to={$Contacts[clist].pid}">{$Twrite}</a></td>
		    <td>
		        <a href="account.php?view=contacts&amp;edit={$Contacts[clist].id}&amp;up">{$Aup}</a><br />
			<a href="account.php?view=contacts&amp;edit={$Contacts[clist].id}&amp;down">{$Adown}</a><br />
			<a href="account.php?view=contacts&amp;edit={$Contacts[clist].id}&amp;delete">{$Adelete}</a>
		    </td>
		</tr>
	    {/section}
    	</table>
    {else}
        {$Nocontacts}
    {/if}
{/if}

{if $View == "proposals"}
    {$Info}<br /><br />
    <ul>
        {foreach $Links2 as $Link}
	    <li><a href="proposals.php?type={$Link@key}">{$Link}</a></li>
	{/foreach}
    </ul>
{/if}
