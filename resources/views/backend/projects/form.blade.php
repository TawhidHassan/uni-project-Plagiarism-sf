@extends('layouts.backend.app')

@section('title','Users')

@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-users icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div>
                {{ __((isset($project) ? 'Edit' : 'Create New') . ' Project') }}
            </div>
        </div>
        <div class="page-title-actions">
            <div class="d-inline-block dropdown">
                <a href="{{ route('app.project.index') }}" class="btn-shadow btn btn-danger">
                    <span class="btn-icon-wrapper pr-2 opacity-7">
                        <i class="fas fa-arrow-circle-left fa-w-20"></i>
                    </span>
                    {{ __('Back to list') }}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <!-- form start -->
        <form role="form" id="userFrom" method="POST"
            action="{{ isset($project) ? route('app.project.update',$project->id) : route('app.project.store') }}">
            @csrf
            @if(isset($project))
                @method('PUT')
            @endif
            <div class="row">
                <div class="col-md-8">
                    <div class="main-card mb-3 card">
                        <div class="card-body">
                            <h5 class="card-title">User Info</h5>

                            <x-forms.textbox label="Project Name" name="project_name" placeholder="Project Name"
                                value="{{ $project->project_name ?? '' }}"
                                field-attributes="required autofocus">
                            </x-forms.textbox>

                            <x-forms.textbox type="text" label="Project Discription" name="project_discription"
                                placeholder="Project Discription"
                                value="{{ $project->project_discription ?? '' }}" />

                            <x-forms.textbox type="text" label="supervisor" name="supervisor"
                                placeholder="supervisor"
                                value="{{ $project->supervisor ?? '' }}"
                                />


                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <div class="col-md-4">
                    <div class="main-card mb-3 card">
                        <div class="card-body">
                            <h5 class="card-title">Select Role and Status</h5>

                            <x-forms.textbox type="number" label="Batch" name="batch" placeholder="batch"  value="{{ $project->batch ?? '' }}"/>

                            <x-forms.textbox type="text" label="Team name" name="team_name" placeholder="team name" value="{{ $project->team_name ?? '' }}"/>
                            <x-forms.textbox type="text" label="Members Names" name="members_names"
                                placeholder="Members Names"
                                value="{{ $project->members_names ?? '' }}" />
                            <x-forms.checkbox label="Status" name="status" class="custom-switch"
                                :value="$project->status ?? null" />


                            <x-forms.button label="Reset" class="btn-danger" icon-class="fas fa-redo"
                                on-click="resetForm('userFrom')" />


                            @isset($project)
                                <x-forms.button type="submit" label="Update" icon-class="fas fa-arrow-circle-up" />
                            @else
                                <x-forms.button type="submit" label="Create" icon-class="fas fa-plus-circle" />
                            @endisset
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
