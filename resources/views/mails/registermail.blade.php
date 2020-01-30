@component('mail::message')
# Introduction

Luda love.

@component('mail::button', ['url' => ''])
Help
@endcomponent
{{  setting('admin.title') }}
Thanks,<br>
{{ config('app.name') }}
@endcomponent
