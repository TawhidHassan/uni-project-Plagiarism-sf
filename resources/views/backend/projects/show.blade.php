@extends('layouts.backend.app')

@section('title','User Details')

@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-users icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div>{{ __('Project Details') }}</div>
        </div>
        <div class="page-title-actions">
            <div class="d-inline-block dropdown">
                <a href="{{ route('app.project.edit',$project->id) }}"
                    class="btn-shadow btn btn-info">
                    <span class="btn-icon-wrapper pr-2 opacity-7">
                        <i class="fas fa-edit fa-w-20"></i>
                    </span>
                    {{ __('Edit') }}
                </a>
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
    <div class="col-md-2">
        <div class="main-card mb-3 card">
            <div class="card-body">
                <img src="{{ asset('images/EUB1.png') }}" class="img-fluid img-thumbnail"
                    alt="avatar">

            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <div class="col-md-10">
        <div class="main-card card">
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <tbody>
                        <tr>
                            <th scope="row">Project Name:</th>
                            <td>{{ $project->project_name }}</td>
                        </tr>

                        <tr>
                            <th scope="row">Project Discription:</th>
                            <td>{{ $project->project_discription }}</td>
                        </tr>
                        <tr>
                            <th scope="row">Batch:</th>
                            <td>
                                <span class="badge badge-danger">{{ $project->batch }}</span>

                            </td>
                        </tr>
                        <tr>
                            <th scope="row">Status:</th>
                            <td>
                                @if($project->status)
                                    <div class="badge badge-success">Active</div>
                                @else
                                    <div class="badge badge-danger">Inactive</div>
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">Project Supervisor:</th>
                            <td>{{ $project->supervisor }}</td>
                        </tr>
                        <tr>
                            <th scope="row">Team Name:</th>
                            <td>{{ $project->team_name }}</td>
                        </tr>
                        <tr>
                            <th scope="row">Members Name:</th>
                            <td><div class="badge badge-success">{{ $project->members_names }}</div></td>
                        </tr>
                        <tr>
                            <th scope="row">Joined At:</th>
                            <td>{{ $project->created_at->diffForHumans() }}</td>
                        </tr>
                        <tr>
                            <th scope="row">Last Modified At:</th>
                            <td>{{ $project->updated_at->diffForHumans() }}</td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>
@endsection
