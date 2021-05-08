<?php

namespace App\Http\Controllers\Backend;

use App\Models\User;
use App\Models\Project;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Gate;
use App\Http\Requests\Project\StoreProjectRequest;
use App\Http\Requests\Project\UpdateProjectRequest;

class ProjectsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('app.project.index');
        $projects = Project::all();
        return view('backend.projects.index',compact('projects'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('app.project.create');
        return view('backend.projects.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProjectRequest $request)
    {
        $user = Project::create([
            'members_names' => $request->members_names,
            'project_name' => $request->project_name,
            'project_discription' => $request->project_discription,
            'team_name' => $request->team_name,
            'status' => $request->filled('status'),
            'batch' => $request->batch,
            'supervisor' => $request->supervisor,
    
        ]);
       
       
        notify()->success('Project Successfully Added.', 'Added');
        return redirect()->route('app.project.index');
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Project $project)
    {
        return view('backend.projects.show',compact('project'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Project $project)
    {
        Gate::authorize('app.project.edit');
        return view('backend.projects.form', compact('project'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProjectRequest $request, Project $project)
    {
        
        $project->update([
            'members_names' => $request->members_names,
            'project_name' => $request->project_name,
            'project_discription' => $request->project_discription,
            'team_name' => $request->team_name,
            'status' => $request->filled('status'),
            'batch' => $request->batch,
            'supervisor' => $request->supervisor,
    
        ]);
       
       
        notify()->success('Project Successfully Updated.', 'Added');
        return redirect()->route('app.project.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Project $Project)
    {
        Gate::authorize('app.project.destroy');
        $Project->delete();
        notify()->success("Project Successfully Deleted", "Deleted");
        return back();
    }
}
