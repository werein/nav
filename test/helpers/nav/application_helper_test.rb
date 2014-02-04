require 'test_helper'

module Nav
  describe ApplicationHelper do
    describe "default navigation" do 
      before do 
        @root = create(:navigation, name: 'default')
      end

      it "should generate navigation" do 
        navigation(@root).must_equal "<ul></ul>"
      end

      it "should generate bootstrap navigation" do 
        navigation(@root, theme: 'bootstrap').must_equal "<ul class=\"nav navbar-nav\"></ul>"
      end

      describe "with one child" do 
        before do 
          @child = create(:navigation, title: 'Apple', parent: @root, permalink: '/apple')
          self.stubs(:current_page?).returns(false)
        end

        it "should generate class current, when is current page" do 
          self.stubs(:current_page?).returns(true)
          navigation(@root).must_equal "<ul><li><a class=\"current\" href=\"/apple\">Apple</a></li></ul>"
        end

        it "should generate without class current, when is not current page" do 
          navigation(@root).must_equal "<ul><li><a class=\"\" href=\"/apple\">Apple</a></li></ul>"
        end

        it "should generate bootstrap themed navigation" do 
          navigation(@root, theme: 'bootstrap').must_equal "<ul class=\"nav navbar-nav\"><li ><a href=\"/apple\">Apple</a></li></ul>"
        end

        describe "with two childs" do 
          before do 
            @subchild = create(:navigation, title: 'iPhone', parent: @child, permalink: '/apple-iphone')
          end
          
          it "should generate tree navigation" do 
            navigation(@root).must_equal "<ul><li><a class=\"\" href=\"/apple\">Apple</a><ul><li><a class=\"\" href=\"/apple-iphone\">iPhone</a></li></ul></li></ul>"
          end

          it "should generate bootstrap themed tree navigation" do 
            navigation(@root, theme: 'bootstrap').must_equal "<ul class=\"nav navbar-nav\"><li class=\"dropdown \"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Apple</a><ul class=\"dropdown-menu\"><li ><a href=\"/apple-iphone\">iPhone</a></li></ul></li></ul>"
          end

          describe "another submenu" do 
            before do 
              @subsubchild = create(:navigation, title: 'iPhone 5', parent: @subchild, permalink: '/apple-iphone-5')
            end

            it "should generate bootstrap themed tree navigation" do 
              navigation(@root, theme: 'bootstrap').must_equal "<ul class=\"nav navbar-nav\"><li class=\"dropdown \"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Apple</a><ul class=\"dropdown-menu\"><li class=\"dropdown-submenu\"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">iPhone</a><ul class=\"dropdown-menu\"><li ><a href=\"/apple-iphone-5\">iPhone 5</a></li></ul></li></ul></li></ul>"
            end

            describe "more nested menu" do 
              before do 
                create(:navigation, title: 'Covers', parent: @subsubchild, permalink: '/apple-iphone-5/covers')
              end

              it "should generate bootstrap themed tree navigation" do 
                navigation(@root, theme: 'bootstrap').must_equal "<ul class=\"nav navbar-nav\"><li class=\"dropdown \"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Apple</a><ul class=\"dropdown-menu\"><li class=\"dropdown-submenu\"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">iPhone</a><ul class=\"dropdown-menu\"><li><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">iPhone 5</a><ul class=\"dropdown-menu\"><li ><a href=\"/apple-iphone-5/covers\">Covers</a></li></ul></li></ul></li></ul></li></ul>"
              end
            end
          end
        end
      end
    end
  end
end