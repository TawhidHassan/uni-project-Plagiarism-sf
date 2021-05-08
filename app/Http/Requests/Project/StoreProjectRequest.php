<?php

namespace App\Http\Requests\Project;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Http\FormRequest;

class StoreProjectRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        Gate::authorize('app.project.create');
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'members_names' => ['required', 'string', 'max:255'],
            'project_name' => ['required', 'string', 'max:255', 'unique:projects'],
            'project_discription' => ['required', 'string'],
            'team_name' => ['required','string'],
            'status' => ['required'],
            'batch' => ['required'],
            'supervisor' => ['required'],
        ];
    }
}
