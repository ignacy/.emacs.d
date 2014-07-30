;;; Compiled snippets and support files for `ruby-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'ruby-mode
                     '(("ctx" "\ncontext \"$1\" do\n  $0\nend" "context" nil nil nil nil nil nil)
                       ("dbg" "puts \"$1 is currently:  #{$1.inspect}\"" "debug" nil nil nil nil nil nil)
                       ("def" "def $1\n    $0\nend\n" "def" nil nil nil nil nil nil)
                       ("delegate" "delegate :$1, to: :$2, prefix: true, allow_nil: true\n$0" "delegate" nil nil nil nil nil nil)
                       ("expect" "expect do\n  $0\nend.to change { $1 }.by($2)" "expect" nil nil nil nil nil nil)
                       ("init" "def initialize($1, $2, $3)\n  @$1 = $1\n  @$2 = $2\n  @$3 = $3\nend\n\n$0" "init" nil nil nil nil nil nil)
                       ("it" "it \"should $1\" do\n  $0\nend\n  " "it" nil nil nil nil nil nil)
                       ("it" "\nit \"should $1\" do\n   $0\nend\n" "it rspec block" nil nil nil nil nil nil)
                       ("let" "let($1) { FactoryGirl.create $1$0 }" "let" nil nil nil nil nil nil)
                       ("rest_controller" "\nclass $1sController < ApplicationController\n\n  def index\n    respond_with $1s\n  end\n\n  def create\n    @$1 = $1.create(params[:$1])\n    respond_with @$1\n  end\n\n  def show\n    respond_with @$1\n  end\n\n  def update\n    @$1.update_attributes(params[:$1])\n    respond_with @$1\n  end\n\n  def destroy\n    @$1.destroy\n    respond_with @$1\n  end\nend\n" "rest_controller" nil nil nil nil nil nil)
                       ("rest_controller_spec" "require 'spec_helper'\n\ndescribe $1sController do\n  let!(:$1) { $0 }\n\n  context '#index' do\n    it \"should list $1s\" do\n      get :index\n      expect(json_response[\"\"]).to eq([])\n    end\n  end\n\n  context '#create' do\n    it 'should not be possible to create $1' do\n      post :create\n    end\n\n    it 'should create $1 with valid attributes' do\n       post :create\n    end\n  end\n\n  context '#update' do\n    it 'should update merchants name' do\n       put :update\n    end\n\n    it 'should return error when attributes are not valid' do\n      put :update\n    end\n  end\n\n  context '#show' do\n    it 'should present merchant through the API' do\n      get :show\n    end\n  end\n\n  context '#destroy' do\n    it 'should be possible to destroy merchant through the API' do\n      delete :destroy\n    end\n  end\nend\n" "rest_controller_spec" nil nil nil nil nil nil)
                       ("spec" "require 'spec_helper'\n\ndescribe $1 do\n  it \"should $2\" do\n    $0\n  end\nend\n" "spec_file" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Mon Jul 28 09:47:58 2014
