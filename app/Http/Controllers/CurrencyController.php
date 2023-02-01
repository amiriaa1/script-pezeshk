<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Currency;
use Auth;

class CurrencyController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('currency')) {
            $lims_currency_all = Currency::all();
            return view('currency.index', compact('lims_currency_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'متاسف! شما اجازه دسترسی به این ماژول را ندارید');
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $data = $request->all();
        Currency::create($data);
        return redirect()->back()->with('message', 'ارز با موفقیت ایجاد شد');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $data = $request->all();
        Currency::find($data['currency_id'])->update($data);
        return redirect()->back()->with('message', 'ارز با موفقیت به روز شد');
    }

    public function destroy($id)
    {
        Currency::find($id)->delete();
        return redirect()->back()->with('message', 'ارز با موفقیت حذف شد');
    }
}
