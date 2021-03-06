@extends('layouts.backend.app')

@section('title','Users')

@push('css')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
@endpush

@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-users icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div>{{ __('All Project') }}</div>
        </div>
        <div class="page-title-actions">
            <div class="d-inline-block dropdown">
                <a href="{{ route('app.project.create') }}" class="btn-shadow btn btn-info">
                    <span class="btn-icon-wrapper pr-2 opacity-7">
                        <i class="fas fa-plus-circle fa-w-20"></i>
                    </span>
                    {{ __('Create Project') }}
                </a>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="main-card mb-3 card">
            <div class="table-responsive">
                <table id="datatable" class="align-middle mb-0 table table-borderless table-striped table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th>Team Name</th>
                            <th class="text-center">Batch</th>
                            <th class="text-center">Project Name</th>
                            <th class="text-center">Joined At</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($projects as $key=>$project)
                            <tr>
                                <td class="text-center text-muted">#{{ $key + 1 }}</td>
                                <td class="">{{ $project->team_name }}</td>
                                <td class="text-center">{{ $project->batch }}</td>
                                <td class="text-center">
                                    @if($project->status)
                                        <div class="badge badge-success">{!! Str::limit($project->project_name, 45, '
                                            ...') !!}</div>
                                    @else
                                        <div class="badge badge-danger">Inactive</div>
                                    @endif
                                </td>
                                <td class="text-center">{{ $project->created_at->diffForHumans() }}</td>
                                <td class="text-center">
                                    <a class="btn btn-secondary btn-sm"
                                        href="{{ route('app.project.show',$project->id) }}"><i
                                            class="fas fa-eye"></i>
                                        <span>Show</span>
                                    </a>
                                    <a class="btn btn-info btn-sm"
                                        href="{{ route('app.project.edit',$project->id) }}"><i
                                            class="fas fa-edit"></i>
                                        <span>Edit</span>
                                    </a>
                                    <button type="button" class="btn btn-danger btn-sm"
                                        onclick="deleteData({{ $project->id }})">
                                        <i class="fas fa-trash-alt"></i>
                                        <span>Delete</span>
                                    </button>
                                    <form id="delete-form-{{ $project->id }}"
                                        action="{{ route('app.project.destroy',$project->id) }}"
                                        method="POST" style="display: none;">
                                        @csrf()
                                        @method('DELETE')
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function () {
            // Datatable
            $("#datatable").DataTable();
        });

    </script>
@endpush
